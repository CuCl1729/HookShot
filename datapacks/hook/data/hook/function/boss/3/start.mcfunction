#> hook:boss/3/start
# hook:world で実行。戦闘開始: 門を閉じ、虚の王とボスバーを出す。
# hook.b3: #state 0 待機 / 1 第1形態 / 2 移行演出 / 3 第2形態 / 4 撃破済み。#hp 4(第1形態 4→2、第2形態 2→0)
# #sp / #pr = 第1形態でトゲ / プレスを使ったか(各1回だけ効く)。#inv 無敵時間。#vuln 第2形態で傷が通る残り tick
scoreboard players set #state hook.b3 1
scoreboard players set #hp hook.b3 4
scoreboard players set #inv hook.b3 0
scoreboard players set #sp hook.b3 0
scoreboard players set #pr hook.b3 0
scoreboard players set #vuln hook.b3 0
kill @e[tag=hook.boss3]
kill @e[tag=hook.b3m]
fill 1514 64 -1 1514 66 1 minecraft:iron_bars
summon zombie 1550.5 64 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss3","hook.s4"],PersistenceRequired:1b,Invulnerable:1b,Rotation:[90.0f,0.0f],CustomName:{text:"虚の王",color:"dark_purple"},equipment:{head:{id:"minecraft:wither_skeleton_skull",count:1},chest:{id:"minecraft:netherite_chestplate",count:1},legs:{id:"minecraft:netherite_leggings",count:1},feet:{id:"minecraft:netherite_boots",count:1}},attributes:[{base:2.0,id:scale},{base:1,id:knockback_resistance},{base:0.2,id:movement_speed},{base:64,id:follow_range},{base:4.0,id:attack_damage}]}
function hook:core/call {f:"hook:boss/3/bar_show"}
playsound minecraft:entity.wither.spawn hostile @a 1550 66 0 3 0.6
title @a[scores={hook.stage=4}] title {text:"虚の王",color:"dark_purple"}
title @a[scores={hook.stage=4}] subtitle {text:"トゲを踏ませ、プレスで潰せ",color:"gray"}
tellraw @a[scores={hook.stage=4}] [{text:"[虚の王] ",color:"dark_purple"},{text:"鉤ひとつで、ここまで来たか。砕けた空も、止まらぬ工場も、すべて我が虚のもの。",color:"gray",italic:true}]
tellraw @a[scores={hook.stage=4}] [{text:"[師範の声] ",color:"yellow"},{text:"奴は重く、トゲを避けて歩く。突っ込んで紫のトゲへ突き飛ばせ。プレスの下へ突き飛ばしたら、よろけている間に標的を撃て。",color:"white"}]
