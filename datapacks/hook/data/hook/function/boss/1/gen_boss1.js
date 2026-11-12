// Writes boss/1/*.mcfunction (deletes the old .mcfunction files first). Run: node gen_boss1.js <datapacks/hook/data/hook/function>
const fs = require("fs");
const D = process.argv[2] + "/boss/1/";
for (const f of fs.readdirSync(D)) if (f.endsWith(".mcfunction")) fs.unlinkSync(D + f);
const w = (f, lines) => fs.writeFileSync(D + f + ".mcfunction", lines.join("\n") + "\n");
const S = "#st hook.b1", T = "#t hook.b1";
const P = "@a[scores={hook.stage=1}]";
const BOX = "x=311,y=60,z=-20,dx=48,dy=43,dz=40";
const hint = (t) => `tellraw ${P} [{text:"▶ ",color:"aqua"},{text:"${t}",color:"gray"}]`;
const act = (t) => `title ${P} actionbar {text:"${t}",color:"light_purple"}`;
const hurt = (n) => `run damage @s ${n} minecraft:mob_attack by @n[tag=hook.boss1]`;
const ISL = [[322, -8], [322, 8], [348, -8], [348, 8], [335, 0]];

w("start", [
  "#> hook:boss/1/start",
  "# @s = 闘技場の箱に入ったプレイヤー。水晶の巨兵を出す。状態は hook.b1 の偽プレイヤー:",
  "# #st 0 待機 / 1 間合い / 2 突進の予告 / 3 突進 / 4 水晶落としの予告 / 5 よろけ(隙)/ 6 踏みつけの予告 / 9 撃破演出",
  "# #t 状態の残り tick / #hp 6 / #inv 無敵 tick / #ph 段階(HP 3 以下で 2)/ #n 技の順番 / #mt 雑魚の間隔 / #dt 撃破演出の経過",
  "# 経路探索は使わない: movement_speed 0 で歩かせず、動きはすべて tp(突進)。トゲは突進の通り道にあれば踏む",
  "function hook:boss/1/reset",
  'execute in hook:world run summon zombie 345.5 71 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss1","hook.s1"],Rotation:[90f,0f],PersistenceRequired:1b,Invulnerable:1b,CustomName:{text:"水晶の巨兵",color:"light_purple"},equipment:{head:{id:"minecraft:amethyst_block",count:1},chest:{id:"minecraft:diamond_chestplate",count:1},legs:{id:"minecraft:diamond_leggings",count:1},feet:{id:"minecraft:diamond_boots",count:1}},attributes:[{base:2.2,id:scale},{base:1,id:knockback_resistance},{base:0,id:movement_speed},{base:6,id:attack_damage},{base:48,id:follow_range}]}',
  `scoreboard players set #hp hook.b1 6`,
  `scoreboard players set #ph hook.b1 1`,
  `scoreboard players set ${S} 1`,
  `scoreboard players set ${T} 40`,
  `scoreboard players set #inv hook.b1 0`,
  `scoreboard players set #n hook.b1 0`,
  `scoreboard players set #mt hook.b1 140`,
  'function hook:core/call {f:"hook:boss/1/bar_show"}',
  "playsound minecraft:block.amethyst_block.resonate hostile @a ~ ~ ~ 2 0.5",
  "title @s times 10 50 15",
  'title @s subtitle {text:"太陽石の欠片を胸に抱いている",color:"gray"}',
  'title @s title {text:"水晶の巨兵",color:"light_purple"}',
  'tellraw @s {text:"坑道の奥で眠っていた守り手が、欠片の光に目を覚ました。",color:"light_purple"}',
  hint("巨兵は赤い炎の線の向きへ一直線に突進する。トゲの島を挟んで誘えば、自分でトゲを踏む。壁にぶつけても、よろけて隙ができる。"),
  hint("湧いた敵を掴んで巨兵へ投げ当てても効く。"),
]);

w("tick", [
  "#> hook:boss/1/tick",
  "# 毎 tick(hook:stage/1/tick から)。戦闘中に誰も闘技場の箱にいなければやり直し(死亡・落下で前室へ戻ったとき)",
  `execute if score ${S} matches 9 run return run function hook:boss/1/end`,
  `execute unless score ${S} matches 1..6 run return 0`,
  "execute if score #inv hook.b1 matches 1.. run scoreboard players remove #inv hook.b1 1",
  `execute in hook:world unless entity @a[scores={hook.stage=1},${BOX}] run return run function hook:boss/1/reset`,
  "execute unless entity @e[tag=hook.boss1] run return run function hook:boss/1/reset",
  "execute as @e[tag=hook.boss1,limit=1] at @s run function hook:boss/1/ai",
]);

w("ai", [
  "#> hook:boss/1/ai",
  "# @s = 巨兵(実行位置も)。状態ごとの処理",
  `scoreboard players remove ${T} 1`,
  "scoreboard players add #mt hook.b1 1",
  "execute if score #mt hook.b1 matches 200.. run function hook:boss/1/minion",
  `execute if score ${S} matches 1 if score ${T} matches ..0 run return run function hook:boss/1/next`,
  `execute if score ${S} matches 2 run return run function hook:boss/1/wind_charge`,
  `execute if score ${S} matches 3 run return run function hook:boss/1/charge`,
  `execute if score ${S} matches 4 run return run function hook:boss/1/wind_rain`,
  `execute if score ${S} matches 5 run return run function hook:boss/1/stunned`,
  `execute if score ${S} matches 6 run return run function hook:boss/1/wind_stomp`,
]);

w("next", [
  "#> hook:boss/1/next",
  "# 次の技。第1段階: 突進・突進・水晶落とし / 第2段階: 突進・踏みつけ・水晶落とし・突進",
  "scoreboard players add #n hook.b1 1",
  "scoreboard players operation #k hook.b1 = #n hook.b1",
  "execute if score #ph hook.b1 matches 1 run scoreboard players operation #k hook.b1 %= #3 hook.constant",
  "execute if score #ph hook.b1 matches 2 run scoreboard players operation #k hook.b1 %= #4 hook.constant",
  "execute if score #k hook.b1 matches 2 run return run function hook:boss/1/begin_rain",
  "execute if score #k hook.b1 matches 1 if score #ph hook.b1 matches 2 run return run function hook:boss/1/begin_stomp",
  "function hook:boss/1/begin_charge",
]);

w("idle", [
  "#> hook:boss/1/idle",
  "# 技の後の間合い(第2段階は短い)",
  `scoreboard players set ${S} 1`,
  `scoreboard players set ${T} 25`,
  `execute if score #ph hook.b1 matches 2 run scoreboard players set ${T} 15`,
  "kill @e[type=marker,tag=hook.b1dir]",
]);

w("begin_charge", [
  "#> hook:boss/1/begin_charge",
  "# 突進の予告を始める。向きは目印 hook.b1dir(予告の最後 14 tick は固定)",
  "kill @e[type=marker,tag=hook.b1dir]",
  'summon marker ~ ~ ~ {Tags:["hook.b1dir","hook.s1"]}',
  `scoreboard players set ${S} 2`,
  `scoreboard players set ${T} 30`,
  `execute if score #ph hook.b1 matches 2 run scoreboard players set ${T} 24`,
  "playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 2 0.6",
]);

w("wind_charge", [
  "#> hook:boss/1/wind_charge",
  "# 突進の予告(30 / 24 tick)。プレイヤーへ向いた炎の線を出し、残り 14 tick で向きを固定する",
  `execute if score ${T} matches 15.. as @n[type=marker,tag=hook.b1dir] run tp @s ~ ~ ~ facing entity @p[scores={hook.stage=1}] feet`,
  "execute as @n[type=marker,tag=hook.b1dir] run rotate @s ~ 0",
  "execute at @n[type=marker,tag=hook.b1dir] rotated as @n[type=marker,tag=hook.b1dir] run function hook:boss/1/line",
  `execute if score ${T} matches ..14 run particle minecraft:angry_villager ~ ~4.6 ~ 0.3 0.2 0.3 0 1 force @a`,
  "particle minecraft:crit ~ ~2 ~ 0.6 1 0.6 0.1 4 force @a",
  `execute if score ${T} matches 1.. run return 0`,
  `scoreboard players set ${S} 3`,
  `scoreboard players set ${T} 45`,
  "playsound minecraft:entity.iron_golem.attack hostile @a ~ ~ ~ 2 0.5",
]);

w("line", ["#> hook:boss/1/line", "# 実行位置・向き = 突進の起点と向き。2 マスおきに炎", ...Array.from({ length: 14 }, (_, i) => `particle minecraft:flame ^ ^0.3 ^${2 + 2 * i} 0.1 0.05 0.1 0 1 force @a`)]);

w("charge", [
  "#> hook:boss/1/charge",
  "# 突進(1 tick に 0.8 / 第2段階 1.2)。壁で止まってよろける。トゲを踏むと hook:boss/1/hit。近くのプレイヤーは傷を負う",
  "scoreboard players set #steps hook.b1 4",
  "execute if score #ph hook.b1 matches 2 run scoreboard players set #steps hook.b1 6",
  "function hook:boss/1/charge_step",
  `execute if score ${S} matches 3 at @s as @a[scores={hook.stage=1},distance=..2.8] ${hurt(6)}`,
  `execute if score ${S} matches 3 at @s run particle minecraft:cloud ~ ~0.3 ~ 0.5 0.1 0.5 0.02 4 force @a`,
  `execute if score ${S} matches 3 if score ${T} matches ..0 run function hook:boss/1/idle`,
]);

w("charge_step", [
  "#> hook:boss/1/charge_step",
  "# @s = 巨兵、実行位置 = いまの足。0.2 進む(#steps 回)。毎歩トゲを見る(速くても飛び越さない)",
  "execute rotated as @n[type=marker,tag=hook.b1dir] positioned ^ ^ ^1.2 unless block ~ ~1.5 ~ #hook:pass run return run function hook:boss/1/crash",
  "execute rotated as @n[type=marker,tag=hook.b1dir] positioned ^ ^ ^0.2 run tp @s ~ ~ ~",
  "execute at @s if block ~ ~ ~ minecraft:amethyst_cluster run return run function hook:boss/1/hit",
  "scoreboard players remove #steps hook.b1 1",
  "execute if score #steps hook.b1 matches 1.. at @s run function hook:boss/1/charge_step",
]);

w("crash", [
  "#> hook:boss/1/crash",
  "# 突進が壁・柱に当たった。2 秒よろける(隙)",
  `scoreboard players set ${S} 5`,
  `scoreboard players set ${T} 40`,
  "particle minecraft:explosion ~ ~1.5 ~ 0.5 0.5 0.5 0 3 force @a",
  "playsound minecraft:entity.zombie.attack_iron_door hostile @a ~ ~ ~ 2 0.5",
  act("巨兵が壁に激突した! 今のうちに敵を投げ当てろ"),
]);

w("stunned", [
  "#> hook:boss/1/stunned",
  "# よろけ(隙)",
  "particle minecraft:crit ~ ~4.6 ~ 0.5 0.1 0.5 0 2 force @a",
  `execute if score ${T} matches ..0 run function hook:boss/1/idle`,
]);

w("begin_rain", [
  "#> hook:boss/1/begin_rain",
  "# 水晶落としの予告を始める。プレイヤーの足元・前・横(第2段階は後ろと逆の横も)に輪",
  "kill @e[type=marker,tag=hook.b1rain]",
  `scoreboard players set ${S} 4`,
  `scoreboard players set ${T} 30`,
  `execute if score #ph hook.b1 matches 2 run scoreboard players set ${T} 24`,
  "execute as @p[scores={hook.stage=1}] at @s rotated ~ 0 run function hook:boss/1/rain_mark",
  "playsound minecraft:block.amethyst_block.resonate hostile @a ~ ~ ~ 2 0.5",
  act("天井から水晶が降る! 光る輪から離れろ"),
]);

const rm = 'summon marker ~ 71 ~ {Tags:["hook.b1rain","hook.s1"]}';
w("rain_mark", [
  "#> hook:boss/1/rain_mark",
  "# @s = プレイヤー(実行位置・水平の向きも)。落ちる所に目印 hook.b1rain(床の高さ)",
  rm,
  `execute positioned ^ ^ ^5 run ${rm}`,
  `execute positioned ^5 ^ ^ run ${rm}`,
  `execute if score #ph hook.b1 matches 2 positioned ^-5 ^ ^ run ${rm}`,
  `execute if score #ph hook.b1 matches 2 positioned ^ ^ ^-5 run ${rm}`,
]);

w("wind_rain", [
  "#> hook:boss/1/wind_rain",
  "# 水晶落としの予告(30 / 24 tick)→ 落下",
  "execute as @e[type=marker,tag=hook.b1rain] at @s run particle minecraft:end_rod ~ ~0.1 ~ 0.9 0 0.9 0 3 force @a",
  "execute as @e[type=marker,tag=hook.b1rain] at @s run particle minecraft:crit ~ ~8 ~ 0.6 3 0.6 0 2 force @a",
  `execute if score ${T} matches 1.. run return 0`,
  "execute as @e[type=marker,tag=hook.b1rain] at @s run function hook:boss/1/rain_hit",
  "function hook:boss/1/idle",
]);

w("rain_hit", [
  "#> hook:boss/1/rain_hit",
  "# @s = 落ちる所の目印。輪(3x3)の真上にいるプレイヤーは高さに関係なく当たる",
  "particle minecraft:explosion ~ ~0.5 ~ 0.6 0.3 0.6 0 3 force @a",
  "playsound minecraft:block.amethyst_cluster.break hostile @a ~ ~ ~ 1.5 0.7",
  `execute positioned ~-1.5 60 ~-1.5 as @a[scores={hook.stage=1},dx=2,dy=44,dz=2] ${hurt(5)}`,
  "kill @s",
]);

w("begin_stomp", [
  "#> hook:boss/1/begin_stomp",
  "# 踏みつけ(第2段階)の予告を始める",
  `scoreboard players set ${S} 6`,
  `scoreboard players set ${T} 30`,
  "playsound minecraft:entity.warden.sonic_charge hostile @a ~ ~ ~ 2 0.6",
  act("巨兵が足を上げた! 柱か壁へ飛んで、床から離れろ"),
]);

w("wind_stomp", [
  "#> hook:boss/1/wind_stomp",
  "# 踏みつけの予告(30 tick)→ 半径 14 の床の上(足が y 73 未満)にいるプレイヤーに傷",
  "particle minecraft:crit ~ ~0.2 ~ 7 0 7 0 20 force @a",
  "particle minecraft:end_rod ~ ~4.6 ~ 0.3 0.3 0.3 0 2 force @a",
  `execute if score ${T} matches 1.. run return 0`,
  "particle minecraft:explosion ~ ~0.5 ~ 7 0.2 7 0 40 force @a",
  "playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.5",
  `execute as @a[scores={hook.stage=1},x=311,y=60,z=-20,dx=48,dy=12,dz=40,distance=..14] ${hurt(7)}`,
  "function hook:boss/1/idle",
]);

w("minion", [
  "#> hook:boss/1/minion",
  "# 10 秒ごとに南北の壁際へ投げる用の雑魚(各1体まで。第2段階は南が爆弾兵)",
  "scoreboard players set #mt hook.b1 0",
  'execute unless entity @e[tag=hook.s1m1] run function hook:stage/1/spawn {k:"zombie",x:335.5,y:71,z:18.5,t:"hook.s1m1"}',
  'execute if score #ph hook.b1 matches 1 unless entity @e[tag=hook.s1m2] run function hook:stage/1/spawn {k:"zombie",x:335.5,y:71,z:-18.5,t:"hook.s1m2"}',
  'execute if score #ph hook.b1 matches 2 unless entity @e[tag=hook.s1m2] run function hook:stage/1/spawn {k:"bomber",x:335.5,y:71,z:-18.5,t:"hook.s1m2"}',
]);

w("hit", [
  "#> hook:boss/1/hit",
  "# @s = 巨兵(実行位置も)。トゲを踏んだ・敵を投げ当てられた(hook:boss/hit、charge_step から)。無敵時間中・戦闘外は無視",
  `execute unless score ${S} matches 1..6 run return 0`,
  "execute if score #inv hook.b1 matches 1.. run return 0",
  "scoreboard players remove #hp hook.b1 1",
  "scoreboard players set #inv hook.b1 40",
  "kill @e[type=marker,tag=hook.b1rain]",
  "# 踏んだトゲの島は砕ける(島どうしは 13 マス以上離れている)",
  "fill ~-2 ~-1 ~-2 ~2 ~1 ~2 minecraft:air replace minecraft:amethyst_cluster",
  "particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0 3 force @a",
  "playsound minecraft:block.amethyst_block.break hostile @a ~ ~ ~ 2 0.6",
  "playsound minecraft:entity.iron_golem.damage hostile @a ~ ~ ~ 2 0.6",
  'function hook:core/call {f:"hook:boss/1/bar_value"}',
  "execute if score #hp hook.b1 matches ..0 run return run function hook:boss/1/defeat",
  "execute if score #hp hook.b1 matches ..3 if score #ph hook.b1 matches 1 run function hook:boss/1/phase2",
  `scoreboard players set ${S} 5`,
  `scoreboard players set ${T} 50`,
]);

w("phase2", [
  "#> hook:boss/1/phase2",
  "# HP 3 以下: 速くなり、踏みつけが加わる。砕けたトゲの島が生え直す",
  "scoreboard players set #ph hook.b1 2",
  "function hook:boss/1/spikes",
  "# 足元の島は生やさない(無敵が切れた瞬間に、よろけたまま踏んで只で傷を負う)",
  "fill ~-2 ~-1 ~-2 ~2 ~1 ~2 minecraft:air replace minecraft:amethyst_cluster",
  "playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 2 0.4",
  `title ${P} times 5 40 10`,
  `title ${P} title {text:""}`,
  `title ${P} subtitle {text:"巨兵の水晶が赤く光る。トゲが生え直した",color:"red"}`,
]);

w("spikes", [
  "#> hook:boss/1/spikes",
  "# 闘技場のトゲの島(土台の紫水晶は build_all)の上にトゲを置く",
  ...ISL.map(([x, z]) => `execute in hook:world run fill ${x - 1} 71 ${z - 1} ${x + 1} 71 ${z + 1} minecraft:amethyst_cluster`),
]);

w("reset", [
  "#> hook:boss/1/reset",
  "# ボス戦を始める前の状態へ(冪等。stage/1/build・start、core/reset、撃破後から)。巨兵・雑魚・目印を消し、バーを隠し、トゲを置き直す",
  "kill @e[tag=hook.boss1]",
  "kill @e[tag=hook.s1m1]",
  "kill @e[tag=hook.s1m2]",
  "kill @e[type=marker,tag=hook.b1dir]",
  "kill @e[type=marker,tag=hook.b1rain]",
  `scoreboard players set ${S} 0`,
  'function hook:core/call {f:"hook:boss/1/bar_hide"}',
  "execute in hook:world run fill 311 71 -20 359 71 20 minecraft:air replace minecraft:amethyst_cluster",
  "function hook:boss/1/spikes",
]);

w("defeat", [
  "#> hook:boss/1/defeat",
  "# @s = HP が尽きた巨兵。膝をつかせて撃破演出へ(#st 9。続きは hook:boss/1/end)",
  `scoreboard players set ${S} 9`,
  "scoreboard players set #dt hook.b1 0",
  "function hook:score/stop",
  'function hook:core/call {f:"hook:boss/1/bar_hide"}',
  "kill @e[tag=hook.s1m1]",
  "kill @e[tag=hook.s1m2]",
  "kill @e[type=marker,tag=hook.b1dir]",
  "tag @s remove hook.enemy",
  "tag @s remove hook.boss",
  "tag @s remove hook.heavy",
  "data merge entity @s {NoAI:1b}",
  "tp @s ~ ~-0.6 ~",
  "particle minecraft:explosion ~ ~2 ~ 1 1.5 1 0 12 force @a",
  "particle minecraft:end_rod ~ ~2.5 ~ 0.4 0.4 0.4 0.1 40 force @a",
  "playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.8",
  "playsound minecraft:block.amethyst_block.resonate hostile @a ~ ~ ~ 2 0.4",
]);

w("end", [
  "#> hook:boss/1/end",
  "# 撃破演出(毎 tick、#dt)。1 欠片 / 80 能力1 / 160 評価 / 260 ステージ2へ(タイトルが重ならないよう間を空ける)",
  "scoreboard players add #dt hook.b1 1",
  "execute if score #dt hook.b1 matches 1 run function hook:boss/1/reward",
  "execute if score #dt hook.b1 matches 80 run function hook:boss/1/ability",
  "execute if score #dt hook.b1 matches 160 run function hook:boss/1/results",
  "execute if score #dt hook.b1 matches 260.. run function hook:boss/1/leave",
]);

w("reward", [
  "#> hook:boss/1/reward",
  "# 撃破の物語(2行)と欠片",
  `execute as ${P} at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1`,
  `title ${P} times 10 60 20`,
  `title ${P} subtitle {text:"水晶の巨兵 撃破",color:"light_purple"}`,
  `title ${P} title {text:"太陽石の欠片 1/3",color:"yellow"}`,
  `tellraw ${P} {text:"巨兵は膝をつき、胸の水晶から太陽石の欠片がこぼれ落ちた。欠片の光で、鉤が輝く。",color:"yellow"}`,
  `tellraw ${P} {text:"太陽石の欠片 1/3。次の欠片は、歯車工場の番人が持っている。",color:"yellow"}`,
]);

w("ability", [
  "#> hook:boss/1/ability",
  "# 能力1「ヘビーインパクト」",
  `scoreboard players set ${P} hook.ability 1`,
  `execute as ${P} at @s run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 1.2`,
  `title ${P} times 10 60 20`,
  `title ${P} subtitle {text:"重い敵に飛びつくと、突き飛ばす",color:"gray"}`,
  `title ${P} title {text:"能力1 ヘビーインパクト",color:"gold"}`,
  hint("能力1「ヘビーインパクト」: 重い敵へ飛んで着くと、その敵を進む向きへ突き飛ばす。壁やトゲにぶつければ倒れる。着いた周りの軽い敵も弾き飛ばす。"),
]);

w("results", [
  "#> hook:boss/1/results",
  "# ステージ1の評価を出し、storage hook: ranks.s1 {r,c,g,pts} に残す(写し元: stage/5/results)",
  `tellraw ${P} {text:"―― 水晶坑道 ――",color:"light_purple",bold:true}`,
  "# shortcut: 閾値は推定(撃破 25・最大コンボ 3・15〜20 分で A 程度)。通しプレイの実測で直す",
  "function hook:score/show {s:-500,a:-800,b:-1100}",
  'data modify storage hook: ranks.s1 set value {r:"C",c:"gray",g:0}',
  'execute if score #pts hook.score matches -1100.. run data modify storage hook: ranks.s1 set value {r:"B",c:"aqua",g:1}',
  'execute if score #pts hook.score matches -800.. run data modify storage hook: ranks.s1 set value {r:"A",c:"red",g:2}',
  'execute if score #pts hook.score matches -500.. run data modify storage hook: ranks.s1 set value {r:"S",c:"gold",g:3}',
  "execute store result storage hook: ranks.s1.pts int 1 run scoreboard players get #pts hook.score",
]);

w("leave", [
  "#> hook:boss/1/leave",
  "# ステージ2へ。坑道の雑魚・鍵・光の粒・巨兵を消し(forceload も外す)、闘技場を待機に戻す",
  "kill @e[type=!player,tag=hook.s1]",
  "function hook:boss/1/reset",
  `execute as ${P} run function hook:stage/2/start`,
  "execute in hook:world run forceload remove 192 -64 511 63",
]);

w("bar_show", [
  "#> hook:boss/1/bar_show",
  "# hook:core/call 経由(bossbar の構文は実例未確認のため隔離)。add は既にあれば失敗するだけ",
  'bossbar add hook:boss1 {text:"水晶の巨兵",color:"light_purple"}',
  'bossbar set hook:boss1 name {text:"水晶の巨兵",color:"light_purple"}',
  "bossbar set hook:boss1 color purple",
  "bossbar set hook:boss1 max 6",
  "bossbar set hook:boss1 value 6",
  "bossbar set hook:boss1 players @a",
  "bossbar set hook:boss1 visible true",
]);
w("bar_value", ["#> hook:boss/1/bar_value", "execute store result bossbar hook:boss1 value run scoreboard players get #hp hook.b1"]);
w("bar_hide", ["#> hook:boss/1/bar_hide", "bossbar set hook:boss1 visible false"]);
console.log("ok");
