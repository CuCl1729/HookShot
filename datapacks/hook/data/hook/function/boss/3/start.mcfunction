#> hook:boss/3/start
# hook:world で実行。戦闘開始: 門を閉じ、虚の王とボスバーを出す。
# hook.b3 の偽プレイヤー: #state 0 待機 / 1 第1形態 / 2 移行演出 / 3 第2形態 / 4 撃破済み。#hp 6(第1形態 6→3、第2形態 3→0)
# #inv 無敵 tick / #stag 怯み tick(>0 の間だけトゲ・プレス・奈落が効き、攻撃が止まる)/ #act 行動(0 待機)/ #t 行動の経過 / #cd 次の行動まで
# 王はバニラの経路探索で動かない(movement_speed 0・follow_range 0)。動くのはスクリプトの tp と突き飛ばしの Motion だけ
scoreboard players set #state hook.b3 1
# 難易度: HP = 6 + #boss_hp_add(足した分は第1形態に乗る。第2形態は常に 3)
scoreboard players set #hp hook.b3 6
execute if score #boss_hp_add hook.diff matches 1.. run scoreboard players operation #hp hook.b3 += #boss_hp_add hook.diff
scoreboard players operation #max hook.b3 = #hp hook.b3
# 予告 = 30 × #tele_pct / 100 tick(100/80/65 → 30/24/19)。act が #t 2 のとき #skip = 30 − 予告 だけ飛ばす
scoreboard players set #skip hook.b3 100
execute if score #tele_pct hook.diff matches 1..100 run scoreboard players operation #skip hook.b3 = #tele_pct hook.diff
scoreboard players operation #skip hook.b3 *= #3 hook.constant
scoreboard players operation #skip hook.b3 /= #10 hook.constant
scoreboard players set #a hook.b3 30
scoreboard players operation #a hook.b3 -= #skip hook.b3
scoreboard players operation #skip hook.b3 = #a hook.b3
scoreboard players set #inv hook.b3 0
scoreboard players set #stag hook.b3 0
scoreboard players set #grd hook.b3 0
scoreboard players set #gd hook.b3 0
kill @e[tag=hook.boss3]
kill @e[tag=hook.b3m]
function hook:boss/3/rest
scoreboard players set #cd hook.b3 60
fill 1514 64 -1 1514 66 1 minecraft:iron_bars
# 戦闘中の落下は入口の島 E へ(壁を越えて落ちても続く)。死亡は died が最初からやり直す
tag @a[scores={hook.stage=4}] add hook.cp_quiet
execute as @a[scores={hook.stage=4}] run function hook:cp/set {id:41,x:1518.5,y:64,z:0.5,yaw:-90}
tag @a remove hook.cp_quiet
summon zombie 1550.5 64 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss3","hook.s4"],PersistenceRequired:1b,Invulnerable:1b,CanPickUpLoot:0b,Rotation:[90.0f,0.0f],CustomName:{text:"虚の王",color:"dark_purple"},equipment:{head:{id:"minecraft:wither_skeleton_skull",count:1},chest:{id:"minecraft:netherite_chestplate",count:1},legs:{id:"minecraft:netherite_leggings",count:1},feet:{id:"minecraft:netherite_boots",count:1}},attributes:[{base:2.0,id:scale},{base:1,id:knockback_resistance},{base:0.0,id:movement_speed},{base:0.0,id:follow_range},{base:0.0,id:attack_damage}]}
function hook:core/call {f:"hook:boss/3/bar_show"}
# 登場: 虚が渦を巻いて玉座の島に立ち上がる(プレイヤーには何もしない)
particle minecraft:reverse_portal 1550.5 66 0.5 1 3 1 0.6 300 force @a
particle minecraft:large_smoke 1550.5 64.5 0.5 3 0.3 3 0.05 120 force @a
particle minecraft:soul_fire_flame 1550.5 64.2 0.5 4 0.1 4 0.02 80 force @a
particle minecraft:sculk_soul 1550.5 67 0.5 1.5 2 1.5 0.05 40 force @a
playsound minecraft:entity.wither.spawn hostile @a 1550 66 0 3 0.6
playsound minecraft:entity.warden.emerge hostile @a 1550 66 0 3 0.7
playsound minecraft:block.end_portal.spawn hostile @a 1550 66 0 2 0.6
title @a[scores={hook.stage=4}] times 10 60 20
title @a[scores={hook.stage=4}] title {text:"虚の王",color:"dark_purple",bold:true}
title @a[scores={hook.stage=4}] subtitle {text:"太陽石を奪った者",color:"gray"}
tellraw @a[scores={hook.stage=4}] {text:"§5虚の王§d「光など要らぬ。闇こそ安らぎだ」"}
function hook:fairy/say {text:"あの手下を掴んで、王に投げつけて！ ひるんだら突き飛ばすんだよ"}
tellraw @a[scores={hook.stage=4}] {text:"王は虚に守られ、突っ込んでも弾かれる。怯ませてから、トゲかプレスへ送り込もう。",color:"gray"}
function hook:boss/3/guide
