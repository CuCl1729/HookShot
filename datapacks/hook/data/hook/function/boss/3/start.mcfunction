#> hook:boss/3/start
# hook:world で実行。戦闘開始: 門を閉じ、虚の王とボスバーを出す。
# hook.b3 の偽プレイヤー: #state 0 待機 / 1 第1形態 / 2 移行演出 / 3 第2形態 / 4 撃破済み。#hp 6(第1形態 6→3、第2形態 3→0)
# #inv 無敵 tick / #stag 怯み tick(>0 の間だけトゲ・プレス・奈落が効き、攻撃が止まる)/ #act 行動(0 待機)/ #t 行動の経過 / #cd 次の行動まで
# 王はバニラの経路探索で動かない(movement_speed 0・follow_range 0)。動くのはスクリプトの tp と突き飛ばしの Motion だけ
scoreboard players set #state hook.b3 1
scoreboard players set #hp hook.b3 6
scoreboard players set #inv hook.b3 0
scoreboard players set #stag hook.b3 0
scoreboard players set #grd hook.b3 0
kill @e[tag=hook.boss3]
kill @e[tag=hook.b3m]
function hook:boss/3/rest
scoreboard players set #cd hook.b3 60
fill 1514 64 -1 1514 66 1 minecraft:iron_bars
# 戦闘中の落下は入口の島 E へ(壁を越えて落ちても続く)。死亡は died が最初からやり直す
execute as @a[scores={hook.stage=4}] run function hook:cp/set {id:41,x:1518.5,y:64,z:0.5,yaw:-90}
summon zombie 1550.5 64 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss3","hook.s4"],PersistenceRequired:1b,Invulnerable:1b,CanPickUpLoot:0b,Rotation:[90.0f,0.0f],CustomName:{text:"虚の王",color:"dark_purple"},equipment:{head:{id:"minecraft:wither_skeleton_skull",count:1},chest:{id:"minecraft:netherite_chestplate",count:1},legs:{id:"minecraft:netherite_leggings",count:1},feet:{id:"minecraft:netherite_boots",count:1}},attributes:[{base:2.0,id:scale},{base:1,id:knockback_resistance},{base:0.0,id:movement_speed},{base:0.0,id:follow_range},{base:0.0,id:attack_damage}]}
function hook:core/call {f:"hook:boss/3/bar_show"}
playsound minecraft:entity.wither.spawn hostile @a 1550 66 0 3 0.6
title @a[scores={hook.stage=4}] times 10 60 20
title @a[scores={hook.stage=4}] title {text:"虚の王",color:"dark_purple"}
title @a[scores={hook.stage=4}] subtitle {text:"手下を投げつけ、怯んだ隙に突き飛ばせ",color:"gray"}
tellraw @a[scores={hook.stage=4}] {text:"§5虚の王§d「光など要らぬ。闇こそ安らぎだ」"}
tellraw @a[scores={hook.stage=4}] {text:"王は虚に守られ、突っ込んでも弾かれる。呼ばれた抜け殻を掴んで投げつけ、怯ませよう。",color:"gray"}
tellraw @a[scores={hook.stage=4}] {text:"怯んだら突っ込んでトゲへ突き飛ばすか、プレスの下へ送って標的を撃つ。爆弾兵なら当てるだけで効く。",color:"gray"}
