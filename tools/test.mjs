// ヘッドレスのデータパックテスト。26.3 クライアント jar の GameTest サーバーを、ゲーム画面なしで起動して結果を集計する。
// 使い方: node tools/test.mjs [--keep] [--timeout 秒] [--overlay <dir>] [--tests <ns:glob>] [-v]
//   --overlay <dir>: <dir>/<pack名>/... を一時 packs へ上書きコピー(陽性対照用。例: <dir>/hook/data/hook/function/x.mcfunction)
// 合否: tools/gametest/pack の関数が `say HOOKTEST <名前> PASS|FAIL <詳細>` を出す。pack 内に書かれた名前が1つでも
//   ログに無ければ FAIL。ログ中のデータパック読み込みエラー、report.xml の失敗、タイムアウトも FAIL。終了コード 0 = 全部 PASS。
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { spawn, spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = path.dirname(path.dirname(fileURLToPath(import.meta.url)));
const mc = process.env.MC_DIR ?? path.resolve(root, '../../../..');
const verDir = path.join(mc, 'versions/26.3');
const args = process.argv.slice(2);
const opt = { keep: false, timeout: 240, overlay: null, tests: 'hooktest:*', v: false };
for (let i = 0; i < args.length; i++) {
  const a = args[i];
  if (a === '--keep') opt.keep = true;
  else if (a === '-v') opt.v = true;
  else if (a === '--timeout') opt.timeout = parseFloat(args[++i]);
  else if (a === '--overlay') opt.overlay = path.resolve(args[++i]);
  else if (a === '--tests') opt.tests = args[++i];
  else { console.error('unknown arg ' + a); process.exit(2); }
}

const javaCandidates = [process.env.JAVA,
  path.join(process.env.LOCALAPPDATA ?? '', 'Packages/Microsoft.4297127D64EC6_8wekyb3d8bbwe/LocalCache/Local/runtime/java-runtime-epsilon/windows-x64/java-runtime-epsilon/bin/java.exe')].filter(Boolean);
const java = javaCandidates.find((p) => fs.existsSync(p)) ?? 'java';

// classpath: 26.3.json の libraries(os=windows の規則だけ)+ クライアント jar
const ver = JSON.parse(fs.readFileSync(path.join(verDir, '26.3.json'), 'utf8'));
const libs = ver.libraries.filter((l) => !l.rules || l.rules.some((r) => r.action === 'allow' && (!r.os || r.os.name === 'windows')))
  .map((l) => path.join(mc, 'libraries', l.downloads.artifact.path));
const missing = libs.filter((p) => !fs.existsSync(p));
if (missing.length) { console.error('missing libraries:\n' + missing.join('\n')); process.exit(2); }
const cp = [...libs, path.join(verDir, '26.3.jar')].join(';').replaceAll(path.sep, '/');

const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'hooktest-'));
const cpDir = (src, dst) => fs.cpSync(src, dst, { recursive: true });
cpDir(path.join(root, 'datapacks/hook'), path.join(tmp, 'packs/hook'));
cpDir(path.join(root, 'tools/gametest/pack'), path.join(tmp, 'packs/hooktest'));
// テスト用サーバーはカスタムディメンションを読み込まない(実測: hook:world は存在しない)。コピーだけ overworld に読み替える
const patch = (d) => fs.readdirSync(d, { withFileTypes: true }).forEach((e) => {
  const p = path.join(d, e.name);
  if (e.isDirectory()) patch(p);
  else if (e.name.endsWith('.mcfunction')) fs.writeFileSync(p, fs.readFileSync(p, 'utf8').replaceAll('hook:world', 'minecraft:overworld'));
});
patch(path.join(tmp, 'packs/hook'));
if (opt.overlay) cpDir(opt.overlay, path.join(tmp, 'packs'));
fs.writeFileSync(path.join(tmp, 'args.txt'), [`-cp "${cp}"`, 'net.minecraft.gametest.Main', '--universe universe', '--packs packs',
  `--tests ${opt.tests}`, '--report report.xml'].join('\n') + '\n');

const logPath = path.join(tmp, 'server.log');
const t0 = Date.now();
const out = fs.openSync(logPath, 'w');
const child = spawn(java, ['@args.txt'], { cwd: tmp, stdio: ['ignore', out, out] });
let timedOut = false;
const timer = setTimeout(() => { timedOut = true; spawnSync('taskkill', ['/PID', String(child.pid), '/T', '/F']); }, opt.timeout * 1000);
const code = await new Promise((res) => child.on('exit', res));
clearTimeout(timer);
if (child.exitCode === null) spawnSync('taskkill', ['/PID', String(child.pid), '/T', '/F']);
const secs = ((Date.now() - t0) / 1000).toFixed(1);

const log = fs.readFileSync(logPath, 'utf8');
const results = new Map(); // name -> {ok, detail}
for (const m of log.matchAll(/HOOKTEST (\S+) (PASS|FAIL)[ \t]*([^\r\n]*)/g)) {
  const prev = results.get(m[1]);
  results.set(m[1], { ok: m[2] === 'PASS' && (!prev || prev.ok), detail: m[3].trim() });
}
// pack 内に書かれた名前 = 期待する結果(1つも出なければ FAIL)
const expected = new Set();
const walk = (d) => fs.readdirSync(d, { withFileTypes: true }).forEach((e) => {
  const p = path.join(d, e.name);
  if (e.isDirectory()) walk(p);
  else if (e.name.endsWith('.mcfunction')) for (const m of fs.readFileSync(p, 'utf8').matchAll(/HOOKTEST (\S+) PASS/g)) expected.add(m[1]);
});
walk(path.join(tmp, 'packs/hooktest'));
if (opt.overlay && fs.existsSync(path.join(opt.overlay, 'hooktest'))) walk(path.join(opt.overlay, 'hooktest'));

// --tests で絞ったときは、走らせたテスト(名前の . より前)の分だけ期待する
const sel = new RegExp('^' + opt.tests.split('*').map((x) => x.replace(/[.+^${}()|[\]\\]/g, '\\$&')).join('.*') + '$');
for (const n of [...expected]) if (!sel.test('hooktest:' + n.split('.')[0])) expected.delete(n);
const fails = [];
for (const n of expected) if (!results.has(n)) fails.push(`${n}: no result (setup did not run or function failed to load)`);
for (const [n, r] of results) if (!r.ok) fails.push(`${n}: ${r.detail}`);
// データパック読み込みエラー(関数パース・レジストリ・タグ)。既知の無害な WARN は含めない
const errRe = /(Test Batch failed|Failed to load|Failed to parse|Couldn't load|Error loading|Failed to (?:execute|read)|Unknown or incomplete command|Parsing errors? in|Invalid .* in|Missing (?:key|element)|Loading errors|Unbound values|Failed to reload|Exception)/;
const errLines = log.split(/\r?\n/).filter((l) => /\/(ERROR|WARN)\]/.test(l) && errRe.test(l));
for (const l of errLines) fails.push('log: ' + l.replace(/^\[[\d:]+\] /, '').slice(0, 300));
let report = '';
try { report = fs.readFileSync(path.join(tmp, 'report.xml'), 'utf8'); } catch {}
if (!report) fails.push('report.xml was not produced (server crashed or was killed)');
for (const m of report.matchAll(/<testcase[^>]*name="([^"]+)"[^>]*>\s*<(failure|error)[^>]*message="([^"]*)"/g)) fails.push(`gametest ${m[1]}: ${m[3]}`);
if (timedOut) fails.push(`timeout after ${opt.timeout}s (server killed)`);
const nTests = (report.match(/<testcase /g) ?? []).length;
if (report && !nTests) fails.push('no gametest ran (--tests pattern matched nothing)');

for (const [n, r] of [...results].sort()) if (opt.v || !r.ok) console.log(`${r.ok ? 'PASS' : 'FAIL'} ${n}${r.detail ? '  ' + r.detail : ''}`);
const pass = [...results.values()].filter((r) => r.ok).length;
console.log(`${fails.length ? 'FAILED' : 'OK'}: ${pass}/${expected.size} checks passed, ${nTests} gametests, ${fails.length} problems, ${secs}s`);
for (const f of fails) console.log('  FAIL ' + f);
if (opt.keep) console.log('kept: ' + tmp); else fs.rmSync(tmp, { recursive: true, force: true });
process.exit(fails.length ? 1 : 0);
