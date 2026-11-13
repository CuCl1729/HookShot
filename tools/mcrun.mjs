// 実行中の Minecraft へ、入力デバイスを使わずにコマンドを渡す(ファイル経由)。
// 前提: ゲーム内で一度 /reload → /function hook:dev/inbox_on。以後データパックが 60 tick おきに reload し、
// load から hook:dev/inbox が inbox_seq の番号が上がったときだけ inbox_body を1回、プレイヤー(@s)として実行する。
// 使い方:
//   node tools/mcrun.mjs "function hook:dev/out/pos" "say hi"      引数1つ = 1行
//   echo "..." | node tools/mcrun.mjs                              標準入力の各行
//   node tools/mcrun.mjs -after 80 "function hook:dev/shoot {x:1,y:2,z:3}" "schedule function hook:dev/report 70t"
//     -after N: N tick 後に終了マーカーを出す(その間 reload を止める)。schedule した結果もまとめて拾える
//   -timeout 秒(既定 15 + N/20)
// 出力: その連番の [CHAT] 行と、関数の読み込みエラー行。終了コード 0 = end、1 = fail/タイムアウト
// テスト用に MCRUN_LOG(ログのパス)と MCRUN_FN(dev 関数フォルダ)で場所を差し替えられる
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.dirname(path.dirname(fileURLToPath(import.meta.url)));
const fnDir = process.env.MCRUN_FN ?? path.join(root, 'datapacks/hook/data/hook/function/dev');
const logPath = process.env.MCRUN_LOG ?? path.join(root, '../../logs/latest.log');
const seqFile = path.join(fnDir, 'inbox_seq.mcfunction');
const bodyFile = path.join(fnDir, 'inbox_body.mcfunction');

const args = process.argv.slice(2);
let after = 0, timeout = 0;
const cmds = [];
for (let i = 0; i < args.length; i++) {
  if (args[i] === '-after') after = parseInt(args[++i], 10);
  else if (args[i] === '-timeout') timeout = parseFloat(args[++i]);
  else cmds.push(args[i]);
}
if (!cmds.length && !process.stdin.isTTY) cmds.push(...fs.readFileSync(0, 'utf8').split(/\r?\n/));
const lines = cmds.map((c) => c.trim().replace(/^\//, '')).filter(Boolean);
if (!lines.length || !(after >= 0)) {
  console.error('usage: node tools/mcrun.mjs [-after ticks] [-timeout sec] "<command>" ...');
  process.exit(2);
}
if (!timeout) timeout = 15 + after / 20;

const seq = parseInt(fs.readFileSync(seqFile, 'utf8').match(/#seq hook\.dev (\d+)/)[1], 10) + 1;
let offset = fs.existsSync(logPath) ? fs.statSync(logPath).size : 0;

if (after > 0) lines.push(`scoreboard players set #hold hook.dev ${after + 5}`, `schedule function hook:dev/inbox_end ${after}t replace`);
lines.push('scoreboard players set #ran hook.dev 1'); // 最後まで来た印。body が読み込まれなければ立たず fail になる
// BOM なしで書く。body を先、引き金の seq を後に
fs.writeFileSync(bodyFile, lines.join('\n') + '\n');
fs.writeFileSync(seqFile, `scoreboard players set #seq hook.dev ${seq}\n`);

const out = [];
let buf = '', result = null;
const deadline = Date.now() + timeout * 1000;
while (!result && Date.now() < deadline) {
  await new Promise((r) => setTimeout(r, 500));
  if (!fs.existsSync(logPath)) continue;
  const size = fs.statSync(logPath).size;
  if (size < offset) offset = 0; // ゲーム再起動でログが作り直された
  if (size === offset) continue;
  const fd = fs.openSync(logPath, 'r');
  const chunk = Buffer.alloc(size - offset);
  fs.readSync(fd, chunk, 0, chunk.length, offset);
  fs.closeSync(fd);
  offset = size;
  buf += chunk.toString('utf8');
  const parts = buf.split('\n');
  buf = parts.pop();
  let inError = false;
  for (const raw of parts) {
    const line = raw.replace(/\r$/, '');
    const chat = line.match(/\[CHAT\] (.*)$/);
    const stamped = /^\[\d\d:\d\d:\d\d\]/.test(line);
    if (chat) {
      out.push(chat[1]);
      const m = chat[1].match(/^MCIN (\d+) (end|fail)$/);
      if (m && +m[1] === seq) result = m[2];
    } else if (/Failed to load function|Failed to execute function|Unknown function/.test(line)) {
      out.push(line);
      inError = true;
    } else if (inError && !stamped && line.trim()) {
      out.push('  ' + line.trim()); // 例外の続きの行(構文エラーの位置)
    } else if (stamped) inError = false;
  }
}

fs.writeFileSync(bodyFile, ''); // 次の reload で同じものが残らないように空にする
console.log(out.join('\n'));
if (result !== 'end') {
  console.error(result === 'fail' ? `MCIN ${seq} fail (body が読み込めない/途中で return した)` : `timeout: MCIN ${seq} の終了マーカーが ${timeout}s 以内に出ない(inbox_on 済みか、ゲームが止まっていないか)`);
  process.exit(1);
}
