// Generates the geometry files of hook:stage/3 and checks reach-gating (hook range 40).
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const OUT = path.dirname(fileURLToPath(import.meta.url)); // このファイルのあるフォルダ(stage/3)へ書く
const [X0, X1, Z0, Z1, Y0, Y1] = [1000, 1300, -48, 47, 40, 120];
const S = {}; // name -> {box:[x1,y1,z1,x2,y2,z2], phase, cmds}

const vol = (x1, y1, z1, x2, y2, z2) => (Math.abs(x2 - x1) + 1) * (Math.abs(y2 - y1) + 1) * (Math.abs(z2 - z1) + 1);
function assert(c, m) { if (!c) throw new Error(m); }
function fill(x1, y1, z1, x2, y2, z2, b, extra = "") {
  assert(vol(x1, y1, z1, x2, y2, z2) <= 32768, `volume ${[x1, y1, z1, x2, y2, z2]}`);
  for (const [v, lo, hi] of [[x1, X0, X1], [x2, X0, X1], [z1, Z0, Z1], [z2, Z0, Z1], [y1, Y0, Y1], [y2, Y0, Y1]])
    assert(lo <= v && v <= hi, `bounds ${[x1, y1, z1, x2, y2, z2, b]}`);
  return `fill ${x1} ${y1} ${z1} ${x2} ${y2} ${z2} minecraft:${b}${extra ? " " + extra : ""}`;
}
const add = (name, box, phase, cmds) => (S[name] = { box, phase, cmds });
function island(name, x1, x2, z1, z2, T, phase = "static", top = "smooth_quartz", mid = "calcite", low = "white_wool") {
  const c = [fill(x1, T, z1, x2, T, z2, top)];
  for (const [i, b] of [[1, mid], [2, low]])
    if (x2 - x1 >= 2 * i && z2 - z1 >= 2 * i) c.push(fill(x1 + i, T - i, z1 + i, x2 - i, T - i, z2 - i, b));
  add(name, [x1, T - 2, z1, x2, T, z2], phase, c);
}
function ring(name, plane, cx, cy, cz, phase, b = "gold_block", r = 2) {
  let box, inner;
  if (plane === "x") { box = [cx, cy - r, cz - r, cx, cy + r, cz + r]; inner = [cx, cy - r + 1, cz - r + 1, cx, cy + r - 1, cz + r - 1]; }
  else { box = [cx - r, cy - r, cz, cx + r, cy + r, cz]; inner = [cx - r + 1, cy - r + 1, cz, cx + r - 1, cy + r - 1, cz]; }
  add(name, box, phase, [fill(...box, b), fill(...inner, "air")]);
}
const bellArch = (x1, x2, T, z) => {
  const m = (x1 + x2) / 2;
  return [fill(x1, T + 1, z, x1, T + 3, z, "quartz_pillar"), fill(x2, T + 1, z, x2, T + 3, z, "quartz_pillar"),
    fill(x1, T + 4, z, x2, T + 4, z, "chiseled_quartz_block"), fill(m, T + 4, z, m, T + 4, z, "target"),
    fill(m, T + 3, z, m, T + 3, z, "bell[attachment=ceiling,facing=east]")];
};

// ---------------- layout ----------------
island("S0", 1002, 1016, -5, 5, 63);
island("R0", 1030, 1036, -3, 3, 66, "lesson");
S.R0.cmds.push(fill(1033, 67, -2, 1033, 71, 2, "gold_block"), fill(1033, 67, -1, 1033, 70, 1, "air"));
island("H", 1066, 1094, -9, 9, 69);
S.H.cmds.push(fill(1080, 70, 0, 1080, 77, 0, "quartz_pillar"), fill(1080, 78, 0, 1080, 78, 0, "sea_lantern"));
for (const z of [-5, 0, 5]) S.H.cmds.push(fill(1091, 70, z, 1091, 70, z, "quartz_pillar"), fill(1091, 71, z, 1091, 71, z, "smooth_stone"));
S.H.cmds.push(fill(1072, 70, -8, 1072, 70, -8, "quartz_pillar"), fill(1072, 71, -8, 1072, 71, -8, "target"));
S.H.box = [1066, 67, -9, 1094, 78, 9];
island("HI", 1074, 1082, -4, 4, 50, "static", "mossy_cobblestone", "tuff", "tuff");
S.HI.cmds.push(fill(1077, 51, -3, 1077, 51, -3, "sea_lantern"));
island("HR", 1088, 1090, -1, 1, 50, "static", "mossy_cobblestone", "tuff", "tuff");
ring("TA1", "z", 1074, 77, -22, "ta");
ring("TA2", "x", 1090, 83, -34, "ta");
ring("TA3", "x", 1076, 89, -44, "ta");
ring("TA4", "x", 1058, 97, -38, "ta");
island("N", 1012, 1026, -47, -37, 108);
S.N.cmds.push(...bellArch(1017, 1021, 108, -43));
S.N.box = [1012, 106, -47, 1026, 112, -37];
island("W1", 1108, 1120, -30, -18, 72);
add("M1", [1134, 53, -25, 1134, 94, -23], "static", []); // 動く範囲(ブロックは mv/place)
add("M2", [1164, 53, -25, 1164, 94, -23], "static", []);
island("W2", 1181, 1191, -30, -20, 58);
add("TC", [1208, 50, -34, 1214, 113, -28], "static", [fill(1208, 50, -34, 1214, 113, -28, "quartz_bricks"),
  fill(1208, 56, -31, 1208, 108, -31, "light_blue_stained_glass"), fill(1214, 56, -31, 1214, 108, -31, "light_blue_stained_glass")]);
island("L1", 1205, 1207, -34, -28, 56);
island("L2", 1208, 1214, -37, -35, 72);
island("L3", 1215, 1217, -34, -28, 86);
island("L4", 1208, 1214, -27, -25, 100);
island("DK", 1204, 1218, -38, -28, 116); // 棚 L4(z -27〜-25)が頂の南面の外へ出るように
S.DK.cmds.push(...bellArch(1209, 1213, 116, -31));
S.DK.box = [1204, 114, -38, 1218, 120, -28];
const CH = [["C1", 1, 1104, 70, 20], ["C2", 2, 1120, 73, 30], ["C3", 3, 1136, 74, 40],
  ["C4a", 4, 1150, 82, 28], ["C4b", 4, 1152, 68, 42], ["C5a", 5, 1167, 84, 24], ["C5b", 5, 1168, 66, 44]];
for (const [n, , cx, T, cz] of CH) island(n, cx - 2, cx + 2, cz - 2, cz + 2, T, "static", "white_wool", "white_wool", "white_wool");
island("SI", 1180, 1194, 30, 44, 78);
S.SI.cmds.push(...bellArch(1187, 1191, 78, 37));
ring("B1", "x", 1116, 76, 0, "bridge");
ring("B2", "x", 1142, 82, 0, "bridge");
island("MI", 1160, 1170, -5, 5, 86, "bridge");
ring("B3", "x", 1196, 94, 0, "bridge");
ring("B4", "x", 1222, 100, 0, "bridge");
ring("B5", "x", 1248, 102, 0, "bridge");
island("G", 1268, 1296, -9, 9, 98);
S.G.cmds.push(fill(1292, 99, -3, 1292, 105, 3, "crying_obsidian"), fill(1292, 99, -2, 1292, 103, 2, "iron_bars"));
S.G.box = [1268, 96, -9, 1296, 105, 9];

// ---------------- reach checks ----------------
function dist(a, b) {
  let d = 0;
  for (let i = 0; i < 3; i++) { const g = Math.max(0, b[i] - (a[i + 3] + 1), a[i] - (b[i + 3] + 1)); d += g * g; }
  return Math.sqrt(d);
}
const D = (a, b) => dist(S[a].box, S[b].box);
const errs = [];
const needFar = (a, others, lim) => { for (const o of others) if (o !== a && D(a, o) < lim) errs.push(`${a}-${o} ${D(a, o).toFixed(1)} < ${lim}`); };
const needNear = (pairs, lim = 36) => { for (const [a, b] of pairs) if (D(a, b) > lim) errs.push(`hop ${a}-${b} ${D(a, b).toFixed(1)} > ${lim}`); };
const names = Object.keys(S);
const stat = names.filter((n) => S[n].phase === "static");
const chase = CH.map((c) => c[0]);
needFar("S0", stat, 46);                                           // 稽古の前は出発の島から出られない
needFar("N", [...stat, "R0"], 46);                                            // 北の島は環でしか行けない
needFar("G", [...stat, ...names.filter((n) => ["ta", "lesson"].includes(S[n].phase))], 50);
needFar("SI", stat.filter((n) => !chase.includes(n)), 46);         // 南の島は崩れ雲からだけ
for (const c of chase) needFar(c, ["W2", "M1", "M2", "TC", "L1", "L2", "L3", "L4", "DK", "N", "S0"], 44);
needFar("W2", ["H", "W1", "HI", "HR", "M1", ...chase], 46);        // 塔の麓は動く錨を渡る(M2 からだけ)
needFar("DK", stat.filter((n) => !["DK", "TC", "L3", "L4"].includes(n)), 41);
needFar("L4", ["W2", "L1"], 41);
for (const t of ["TA1", "TA2", "TA3", "TA4"]) needFar(t, ["S0"], 46);
needNear([["S0", "R0"], ["R0", "H"], ["H", "HI"], ["HI", "HR"], ["H", "TA1"], ["TA1", "TA2"], ["TA2", "TA3"],
  ["TA3", "TA4"], ["TA4", "N"], ["H", "W1"], ["W1", "M1"], ["M2", "W2"], ["W2", "L1"], ["L1", "L2"],
  ["L2", "L3"], ["L3", "L4"], ["L4", "DK"], ["H", "C1"], ["C1", "C2"], ["C2", "C3"], ["C3", "C4a"],
  ["C3", "C4b"], ["C4a", "C5a"], ["C4b", "C5b"], ["C5a", "SI"], ["C5b", "SI"], ["H", "B1"], ["B1", "B2"],
  ["B2", "MI"], ["MI", "B3"], ["B3", "B4"], ["B4", "B5"], ["B5", "G"]]);
if (process.argv.includes("--dist")) for (const [a, b] of [["H", "N"], ["TA3", "N"], ["TA2", "N"], ["DK", "L2"], ["SI", "C3"], ["G", "DK"], ["W2", "L4"], ["S0", "H"]]) console.log(a, b, D(a, b).toFixed(1));
if (errs.length) { console.log(errs.join("\n")); process.exit(1); }
console.log("reach checks ok");

// ---------------- emit ----------------
const W = (p, lines) => { fs.mkdirSync(path.dirname(path.join(OUT, p)), { recursive: true }); fs.writeFileSync(path.join(OUT, p), lines.join("\n") + "\n", "utf8"); };
const b = ["#> hook:stage/3/build",
  "# 天空回廊(hook:world, x 1000〜1300, z -48〜47, y 40〜120)。冪等。start が forceload した全チャンクが読み込まれるまで何もしない(stage/3/tick が毎 tick 呼ぶ)",
  "# 座標は同じフォルダの gen3.mjs が生成(node gen3.mjs。到達距離 40 の検査つき)"];
for (let cx = Math.floor(X0 / 16) * 16; cx <= X1; cx += 16)
  for (let cz = Math.floor(Z0 / 16) * 16; cz <= Z1; cz += 16) b.push(`execute in hook:world unless loaded ${cx} 63 ${cz} run return 0`);
b.push("execute in hook:world run function hook:stage/3/build_all", "data modify storage hook: built.s3 set value 1b");
W("build.mcfunction", b);

const a = ["#> hook:stage/3/build_all",
  "# in hook:world から(hook:stage/3/build)。範囲を全部消してから、最初から在る島・塔・崩れ雲・動く錨・スイッチを建てる",
  "# 区画: S0 出発 / R0 稽古で出る / H 風の広場 / HI HR 隠し(広場の真下) / TA1-4 疾風の環(号砲で出る)→ N 北の鐘",
  "#       W1 → 動く錨 M1 M2 → W2 → 塔 TC の棚 L1-L4 → 頂 DK 塔の鐘 / C1-C5 崩れ雲 → SI 南の鐘 / B1-5 MI 虹の橋 → G 門の島",
  "kill @e[type=marker,tag=hook.s3m]"];
for (let x = X0; x <= X1; x += 4) a.push(fill(x, Y0, Z0, Math.min(x + 3, X1), Y1, Z1, "air"));
for (const n of names) if (S[n].phase === "static" && !chase.includes(n)) a.push(`# ${n}`, ...S[n].cmds);
a.push("function hook:stage/3/chase/build", "function hook:stage/3/mv/step",
  "# スイッチ(標的の中心。hook:hook/switch が呼ぶ)",
  'summon marker 1072.5 71.5 -7.5 {Tags:["hook.switch","hook.s3m"],data:{f:"hook:stage/3/ta/start"}}',
  'summon marker 1019.5 112.5 -42.5 {Tags:["hook.switch","hook.s3m"],data:{f:"hook:stage/3/bell/n"}}',
  'summon marker 1211.5 120.5 -30.5 {Tags:["hook.switch","hook.s3m"],data:{f:"hook:stage/3/bell/t"}}',
  'summon marker 1189.5 82.5 37.5 {Tags:["hook.switch","hook.s3m"],data:{f:"hook:stage/3/bell/s"}}',
  "# 光の粒(寄り道の先。tick が近接を見て hook:lore/pick を呼ぶ)",
  "kill @e[type=item_display,tag=hook.lore]",
  'summon item_display 1076.5 52.3 2.5 {Tags:["hook.lore","hook.lore31"],item:{id:"minecraft:glowstone_dust",count:1},item_display:"ground",Glowing:1b,transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.9f,0.9f,0.9f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}',
  'summon item_display 1182.5 79.3 42.5 {Tags:["hook.lore","hook.lore32"],item:{id:"minecraft:glowstone_dust",count:1},item_display:"ground",Glowing:1b,transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.9f,0.9f,0.9f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}',
  'summon item_display 1014.5 109.3 -46.5 {Tags:["hook.lore","hook.lore33"],item:{id:"minecraft:glowstone_dust",count:1},item_display:"ground",Glowing:1b,transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.9f,0.9f,0.9f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}');
W("build_all.mcfunction", a);

const cb = ["#> hook:stage/3/chase/build", "# in hook:world。崩れ雲 C1〜C5 を建て直す(gen3.mjs が生成)"];
for (const [n] of CH) cb.push(...S[n].cmds);
W("chase/build.mcfunction", cb);

const ct = ["#> hook:stage/3/chase/tick",
  "# in hook:world、#chase 1.. の間(gen3.mjs が生成)。番号 k の雲は 50k tick で赤くなり 50k+50 tick で崩れる(最初の崩落まで 5 秒)"];
for (const [, k, cx, T, cz] of CH) {
  const w = 50 * k, c = 50 * k + 50;
  ct.push(`execute if score #chase hook.s3 matches ${w} run ` + fill(cx - 2, T, cz - 2, cx + 2, T, cz + 2, "red_wool", "replace minecraft:white_wool"),
    `execute if score #chase hook.s3 matches ${w} run playsound minecraft:block.wool.break block @a ${cx} ${T} ${cz} 2 0.6`,
    `execute if score #chase hook.s3 matches ${c} run ` + fill(cx - 2, T - 2, cz - 2, cx + 2, T, cz + 2, "air"),
    `execute if score #chase hook.s3 matches ${c} run particle minecraft:cloud ${cx} ${T} ${cz} 1.5 0.3 1.5 0.02 40 force @a`,
    `execute if score #chase hook.s3 matches ${c} run playsound minecraft:block.wool.break block @a ${cx} ${T} ${cz} 3 0.5`);
}
W("chase/tick.mcfunction", ct);

const ta = ["#> hook:stage/3/ta/rings", "# in hook:world。疾風の環 TA1〜TA4 を出す(gen3.mjs が生成)"];
const tc = ["#> hook:stage/3/ta/clear", "# in hook:world。疾風の環を消す(gen3.mjs が生成)"];
for (const n of ["TA1", "TA2", "TA3", "TA4"]) { ta.push(...S[n].cmds); tc.push(fill(...S[n].box, "air")); }
W("ta/rings.mcfunction", ta);
W("ta/clear.mcfunction", tc);

const br = ["#> hook:stage/3/bridge_blocks", "# in hook:world。虹の橋(環 B1〜B5 と中の島 MI)を出す(gen3.mjs が生成)"];
for (const n of ["B1", "B2", "MI", "B3", "B4", "B5"]) br.push(...S[n].cmds);
W("bridge_blocks.mcfunction", br);
W("r0_blocks.mcfunction", ["#> hook:stage/3/r0_blocks", "# in hook:world。稽古を終えると出る環の島 R0(gen3.mjs が生成)", ...S.R0.cmds]);
console.log("written");
