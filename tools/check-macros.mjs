// マクロ関数(`$` 行を含む .mcfunction)はヘッドレスでも呼ばれるまでパースされない。そこで `$(名前)` を見本値で展開した
// 静的コピーを一時オーバーレイに作り、tools/test.mjs --overlay で読み込ませて構文エラー(Failed to load function)を拾う。
// 使い方: node tools/check-macros.mjs [--probe] [--set 名前=値 ...] [--keep]
//   --probe: 壊れたマクロを1つ混ぜる(陽性対照。これが検出されなければ検査が効いていない)
//   --set k=v: 見本値の上書き(既定は下の表。表に無い名前は数値 1 = 文字列の中でも数値としても通る)
// 見本値で展開するので、値が実行時に別の形になる呼び出し(例 `$(s)` が数値にも名前にもなる)は片方しか検査できない。
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = path.dirname(path.dirname(fileURLToPath(import.meta.url)));
const fnDir = path.join(root, 'datapacks/hook/data/hook/function');
const sample = { f: 'hook:load', c: 'gold', tag: 'hook.sample', kind: 'zombie', k: 'zombie', obj: 'hook.score', out: 'hook.temporary',
  name: '#sample', text: 'テスト', sub: 'テスト', dir: '右前', n: '1', r: '1' };
const args = process.argv.slice(2);
let probe = false, keep = false;
for (let i = 0; i < args.length; i++) {
  if (args[i] === '--probe') probe = true;
  else if (args[i] === '--keep') keep = true;
  else if (args[i] === '--set') { const [k, v] = args[++i].split('='); sample[k] = v; }
  else { console.error('unknown arg ' + args[i]); process.exit(2); }
}

const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'hookmacro-'));
const outDir = path.join(tmp, 'hook/data/hook/function');
let files = 0, lines = 0;
const walk = (d, rel) => fs.readdirSync(d, { withFileTypes: true }).forEach((e) => {
  const p = path.join(d, e.name), r = path.join(rel, e.name);
  if (e.isDirectory()) return walk(p, r);
  if (!e.name.endsWith('.mcfunction')) return;
  const src = fs.readFileSync(p, 'utf8').split(/\r?\n/);
  if (!src.some((l) => l.startsWith('$'))) return;
  const dst = src.map((l) => {
    if (!l.startsWith('$')) return l;
    lines++;
    return l.slice(1).replace(/\$\(([A-Za-z_0-9]+)\)/g, (_, k) => sample[k] ?? '1');
  });
  fs.mkdirSync(path.dirname(path.join(outDir, r)), { recursive: true });
  fs.writeFileSync(path.join(outDir, r), dst.join('\n').replaceAll('hook:world', 'minecraft:overworld'));
  files++;
});
walk(fnDir, '');
if (probe) { fs.writeFileSync(path.join(outDir, '_probe.mcfunction'), 'say ok\nparticle minecraft:block{block_state:"x"} 0 0 0 1 1 1 0 1\nbogus_command 1\n'); files++; }
console.log(`macro files expanded: ${files} (${lines} macro lines)`);

const r = spawnSync(process.execPath, [path.join(root, 'tools/test.mjs'), '--overlay', tmp, '--tests', 'hooktest:enemy'], { encoding: 'utf8' });
const out = (r.stdout + r.stderr).split(/\r?\n/).filter((l) => /FAIL|problems|FAILED|OK:/.test(l) && !/^PASS/.test(l));
console.log(out.join('\n'));
if (!keep) fs.rmSync(tmp, { recursive: true, force: true }); else console.log('kept: ' + tmp);
process.exit(r.status ?? 1);
