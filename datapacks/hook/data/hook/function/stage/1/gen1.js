// Generates hook:stage/1/build and build_all from one coordinate table. Run: node gen1.js <datapacks/hook/data/hook/function>
const fs = require("fs");
const D = process.argv[2] + "/stage/1/";
const W = "in hook:world";
const vol = (a) => (Math.abs(a[3] - a[0]) + 1) * (Math.abs(a[4] - a[1]) + 1) * (Math.abs(a[5] - a[2]) + 1);
const out = [];
const F = (a, b, extra = "") => {
  if (vol(a) > 32768) throw new Error("fill too big " + a);
  out.push(`fill ${a.join(" ")} minecraft:${b}${extra ? " " + extra : ""}`);
};
const C = (s) => out.push(s);

// ---- build (load checks + clear) ----
const X0 = 199, X1 = 501, Z0 = -64, Z1 = 63, Y0 = 44, Y1 = 118;
const b = [
  "#> hook:stage/1/build",
  "# 水晶坑道(hook:world, x 199〜501, z -64〜63, y 44〜118)。stage/1/tick が built.s1 の無い間毎 tick 呼ぶ。冪等: 範囲を消してから建てる",
  "# 生成: scratchpad の gen1.js(読み込み確認・消去・トゲ・標的の目印は表から機械的に並べている。fill は 32768 以下)",
];
for (let x = 192; x <= 496; x += 16) for (let z = -64; z <= 48; z += 16) b.push(`execute ${W} unless loaded ${x + 8} 64 ${z + 8} run return 0`);
b.push("# トゲは土台より先に消す(土台ごと消すと欠片が落ちる)。新版は y 51/71、旧版は y 64");
for (const y of [51, 64, 71]) for (const [a, c] of [[X0, 350], [351, X1]]) {
  const r = [a, y, Z0, c, y, Z1];
  if (vol(r) > 32768) throw new Error("spike clear too big");
  b.push(`execute ${W} run fill ${r.join(" ")} minecraft:air replace minecraft:amethyst_cluster`);
}
for (let x = X0; x <= X1; x += 3) {
  const r = [x, Y0, Z0, Math.min(x + 2, X1), Y1, Z1];
  if (vol(r) > 32768) throw new Error("clear too big");
  b.push(`execute ${W} run fill ${r.join(" ")} minecraft:air`);
}
b.push(`execute ${W} run kill @e[type=item,x=${X0},y=40,z=${Z0},dx=${X1 - X0},dy=80,dz=${Z1 - Z0}]`);
b.push("kill @e[type=!player,tag=hook.s1]");
b.push(`execute ${W} run function hook:stage/1/build_all`);
b.push(`execute ${W} run function hook:boss/1/reset`);
b.push("data modify storage hook: built.s1 set value 1b");
fs.writeFileSync(D + "build.mcfunction", b.join("\n") + "\n");

// ---- build_all ----
C("#> hook:stage/1/build_all");
C("# in hook:world から(stage/1/build。範囲は消してある)。生成: gen1.js。床の上面: 入口・大空洞・竪坑 y 50 / 広間・選鉱場・闘技場 y 70 / 通路・前室 y 96");
C("# 大空洞(ハブ)x 211〜249 z ±19 y 51〜111 → 南: 竪坑 A(垂直登攀)/ 北中段: 広間 B(ウェーブ)/ 東中段: 選鉱場 C(投げパズル)/ 東上段: 門 → 通路 → 前室 → 闘技場");
const M = "deepslate_bricks", T = "deepslate_tiles";
// box shell: floor/ceiling/4 walls
const shell = (x0, y0, z0, x1, y1, z1, wall = M, floor = T) => {
  F([x0, y0, z0, x1, y0, z1], floor);
  F([x0, y1, z0, x1, y1, z1], wall);
  F([x0, y0, z0, x0, y1, z1], wall);
  F([x1, y0, z0, x1, y1, z1], wall);
  F([x0, y0, z0, x1, y1, z0], wall);
  F([x0, y0, z1, x1, y1, z1], wall);
};
const spikes = (x0, z0, x1, z1, y) => { F([x0, y, z0, x1, y, z1], "amethyst_block"); F([x0, y + 1, z0, x1, y + 1, z1], "amethyst_cluster"); };
const target = (r, f, tag) => {
  F(r, "target");
  for (let x = r[0]; x <= r[3]; x++) for (let y = r[1]; y <= r[4]; y++) for (let z = r[2]; z <= r[5]; z++)
    C(`summon marker ${x + 0.5} ${y + 0.5} ${z + 0.5} {Tags:["hook.switch","hook.s1","${tag}"],data:{f:"${f}"}}`);
};
const disp = (x, y, z, item, tags, s = 0.8) =>
  C(`summon item_display ${x} ${y} ${z} {Tags:[${tags.map((t) => `"${t}"`).join(",")}],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,item:{id:"minecraft:${item}",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[${s}f,${s}f,${s}f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}`);
// 明かり: hook:world は overworld 型で天井の下は真っ暗。各部屋に light の面を約 12 段ごとに置く(light は #hook:pass なのでフック・投げ・引き寄せを遮らない)
const lightPlane = (x0, z0, x1, z1, ys) => { for (const y of ys) F([x0, y, z0, x1, y, z1], "light[level=15]", "replace minecraft:air"); };

C("\n# 入口のトンネル x 200〜209(始まり 202.5)");
F([199, 49, -3, 210, 56, 3], M); F([200, 51, -2, 210, 55, 2], "air"); F([199, 50, -2, 209, 50, 2], T);

C("\n# 大空洞");
shell(210, 50, -20, 250, 112, 20);
F([210, 51, -2, 210, 55, 2], "air");           // 西: 入口
F([226, 51, -20, 234, 57, -20], "air");        // 南: 竪坑 A
F([226, 71, 20, 234, 76, 20], "air");          // 北中段: 広間 B(床 y 70 の縁を撃つ)
F([250, 71, 6, 250, 76, 14], "air");           // 東中段: 選鉱場 C
F([250, 97, -3, 250, 102, 3], "air");          // 東上段: 門
C("# 中央の柱(上面 y 80。門・中段の口へはここから)");
F([228, 51, -2, 232, 80, 2], "polished_deepslate");
F([228, 80, -2, 232, 80, 2], "amethyst_block");
C("# 床のトゲ(掴んで上で放す)");
spikes(217, -11, 221, -7, 50); spikes(239, 7, 243, 11, 50); spikes(217, 7, 221, 11, 50);
C("# 光の粒1: 北西の高い棚(柱の上から)");
F([211, 97, 15, 215, 99, 19], "cobbled_deepslate");
disp(213.5, 100.3, 17.5, "glowstone_dust", ["hook.lore", "hook.s1", "hook.s1lore"]);
C("# 飾りと明かり");
F([211, 60, -19, 211, 66, -15], "budding_amethyst"); F([249, 85, 15, 249, 92, 19], "budding_amethyst");

C("\n# 竪坑 A(垂直登攀)x 222〜238 z -40〜-21。底はトゲ(敵を落とすと倒れる)。張り出し L1〜L4 を交互に登り、L4 に水晶鍵");
shell(221, 50, -41, 239, 112, -20);
F([226, 51, -20, 234, 57, -20], "air");
spikes(222, -40, 238, -26, 50);
F([222, 60, -34, 226, 62, -30], "cobbled_deepslate");   // L1 上面 62
F([234, 72, -40, 238, 74, -36], "cobbled_deepslate");   // L2 74(スケルトン)
F([222, 84, -40, 226, 86, -36], "cobbled_deepslate");   // L3 86(スケルトン)
F([233, 96, -30, 238, 98, -25], "cobbled_deepslate");   // L4 98(鍵)
F([222, 106, -24, 225, 108, -21], "cobbled_deepslate"); // L5 108(光の粒2)
disp(235.5, 99.5, -27.5, "amethyst_shard", ["hook.s1", "hook.s1key", "hook.s1ka"], 1.2);
disp(223.5, 109.3, -22.5, "glowstone_dust", ["hook.lore", "hook.s1", "hook.s1lore"]);
F([238, 60, -40, 238, 66, -37], "budding_amethyst");

C("\n# 広間 B(ウェーブ)。通路 z 21〜27 → 広間 x 212〜248 z 29〜61 床 y 70。入ると格子(z 28)が閉じ、3波を倒すと開いて柱の上に鍵");
F([225, 69, 21, 235, 77, 27], M); F([226, 71, 21, 234, 76, 27], "air"); F([226, 70, 21, 234, 70, 27], T);
shell(211, 70, 28, 249, 93, 62);
F([226, 71, 28, 234, 76, 28], "air");
spikes(218, 36, 222, 40, 70); spikes(238, 36, 242, 40, 70); spikes(218, 52, 222, 56, 70); spikes(238, 52, 242, 56, 70);
F([229, 71, 44, 231, 82, 46], "polished_deepslate");    // 中央の柱 上面 82
F([212, 78, 43, 214, 80, 47], "cobbled_deepslate");     // 西の棚 80
F([246, 78, 43, 248, 80, 47], "cobbled_deepslate");     // 東の棚 80
F([211, 75, 55, 211, 82, 60], "budding_amethyst");

C("\n# 選鉱場 C(投げパズル)。通路 x 251〜257 → 部屋 x 259〜297 z -6〜26 床 y 70 天井 y 95。的3つに敵を投げ当てると檻が開く");
F([251, 69, 5, 258, 77, 15], M); F([250, 71, 6, 258, 76, 14], "air"); F([251, 70, 6, 257, 70, 14], T);
shell(258, 70, -7, 298, 95, 27);
F([258, 71, 6, 258, 76, 14], "air");
C("# 的1: 北の壁(前にトゲの堀)");
spikes(264, 22, 274, 26, 70);
target([268, 73, 27, 270, 75, 27], "hook:stage/1/c/t1", "hook.s1t1");
C("# 的2: 天井");
target([278, 95, 0, 280, 95, 2], "hook:stage/1/c/t2", "hook.s1t2");
spikes(276, -2, 282, 4, 70);
C("# 的3: 東の壁の窪み(前に重装兵が立つ。足元はトゲ: 足止めの重装兵は自分では死なず、敵を投げ当てて弾くとトゲで倒れる)");
F([292, 71, 16, 297, 77, 16], M); F([292, 71, 22, 297, 77, 22], M); F([292, 77, 16, 297, 77, 22], M);
spikes(292, 17, 297, 21, 70);
target([298, 72, 18, 298, 74, 20], "hook:stage/1/c/t3", "hook.s1t3");
C("# 鍵の檻(的3つで開く)");
F([292, 71, 8, 296, 75, 12], "iron_bars", "hollow");
F([292, 70, 8, 296, 70, 12], "amethyst_block");
C("# (鍵は檻が開いてから c/done が出す。格子は薄く、押し付けると檻の外からでも 2.5 以内に入るため)");
C("# 光の粒3: 南西の高い棚");
F([259, 88, -6, 262, 90, -3], "cobbled_deepslate");
disp(260.5, 91.3, -4.5, "glowstone_dust", ["hook.lore", "hook.s1", "hook.s1lore"]);

C("\n# 門(大空洞の東上段。水晶鍵3つで格子が消える)と通路 x 251〜299、前室 x 300〜309(床 y 96)");
F([251, 96, -4, 309, 103, 4], M); F([251, 97, -3, 309, 102, 3], "air"); F([251, 96, -3, 309, 96, 3], T);
F([252, 97, -3, 252, 102, 3], "iron_bars");
F([300, 96, -3, 309, 96, 3], "polished_deepslate");

C("\n# 闘技場 x 311〜359 z ±20 床 y 70 天井 y 104。前室から西の口(x 310, y 97〜102)で降りる。トゲの島の上のトゲは boss/1/reset が置き直す");
shell(310, 70, -21, 360, 104, 21, M, "polished_deepslate");
F([310, 97, -3, 310, 102, 3], "air");
for (const [x, z] of [[315, -17], [315, 17], [355, -17], [355, 17]]) F([x - 1, 71, z - 1, x + 1, 86, z + 1], "polished_deepslate");
for (const [x, z] of [[322, -8], [322, 8], [348, -8], [348, 8], [335, 0]]) F([x - 1, 70, z - 1, x + 1, 70, z + 1], "amethyst_block");
F([360, 80, -6, 360, 92, 6], "budding_amethyst");

C("\n# 明かり(最後に。空気だけを置き換える)");
lightPlane(200, -2, 209, 2, [54]);
lightPlane(211, -19, 249, 19, [58, 70, 82, 94, 106]);
lightPlane(222, -40, 238, -21, [58, 70, 82, 94, 106]);
lightPlane(212, 21, 248, 61, [76, 88]);
lightPlane(251, -6, 297, 26, [76, 88]);
lightPlane(251, -3, 309, 3, [100]);
lightPlane(311, -20, 359, 20, [76, 88, 100]);

fs.writeFileSync(D + "build_all.mcfunction", out.join("\n") + "\n");
console.log("ok", b.length, out.length);
