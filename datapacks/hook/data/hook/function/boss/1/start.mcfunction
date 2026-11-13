#> hook:boss/1/start
# @s = 闘技場の箱に入ったプレイヤー。水晶の巨兵を出す。状態は hook.b1 の偽プレイヤー:
# #st 0 待機 / 1 間合い / 2 突進の予告 / 3 突進 / 4 水晶落としの予告 / 5 よろけ(隙)/ 6 踏みつけの予告 / 9 撃破演出
# #t 状態の残り tick / #hp 6 / #inv 無敵 tick / #ph 段階(HP 3 以下で 2)/ #n 技の順番 / #mt 雑魚の間隔 / #dt 撃破演出の経過
# 経路探索は使わない: movement_speed 0 で歩かせず、動きはすべて tp(突進)。トゲは突進の通り道にあれば踏む
function hook:boss/1/reset
execute in hook:world run summon zombie 345.5 71 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss1","hook.s1"],Rotation:[90f,0f],PersistenceRequired:1b,Invulnerable:1b,CustomName:{text:"水晶の巨兵",color:"light_purple"},equipment:{head:{id:"minecraft:amethyst_block",count:1},chest:{id:"minecraft:diamond_chestplate",count:1},legs:{id:"minecraft:diamond_leggings",count:1},feet:{id:"minecraft:diamond_boots",count:1}},attributes:[{base:2.2,id:scale},{base:1,id:knockback_resistance},{base:0,id:movement_speed},{base:6,id:attack_damage},{base:48,id:follow_range}]}
scoreboard players set #hp hook.b1 6
# 難易度: HP に #boss_hp_add(0/1/2)を足す(未設定ならノーマルと同じ 6)
execute if score #boss_hp_add hook.diff matches 1.. run scoreboard players operation #hp hook.b1 += #boss_hp_add hook.diff
scoreboard players set #shot hook.b1 0
scoreboard players set #ph hook.b1 1
scoreboard players set #st hook.b1 1
scoreboard players set #t hook.b1 40
scoreboard players set #inv hook.b1 0
scoreboard players set #n hook.b1 0
scoreboard players set #mt hook.b1 140
function hook:core/call {f:"hook:boss/1/bar_show"}
playsound minecraft:block.amethyst_block.resonate hostile @a ~ ~ ~ 2 0.5
playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 1 1.4
execute in hook:world run particle minecraft:reverse_portal 345.5 73 0.5 2 3 2 0.2 300 force @a
execute in hook:world run particle minecraft:end_rod 345.5 74 0.5 1 2 1 0.3 120 force @a
execute in hook:world run particle minecraft:explosion 345.5 72 0.5 1.5 1 1.5 0 10 force @a
title @s times 10 50 15
title @s subtitle {text:"太陽石の欠片を胸に抱いている",color:"gray"}
title @s title {text:"水晶の巨兵",color:"light_purple"}
tellraw @s {text:"坑道の奥で眠っていた守り手が、欠片の光に目を覚ました。",color:"light_purple"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"巨兵は赤い炎の線の向きへ一直線に突進する。トゲの島を挟んで誘えば、自分でトゲを踏む。壁にぶつけても、よろけて隙ができる。",color:"gray"}]
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"湧いた敵を掴んで巨兵へ投げ当てても効く(当てた敵は砕けて消える)。",color:"gray"}]
function hook:fairy/say {text:"あの胸の光……欠片だ！ トゲの島へ突っこませよう"}
function hook:guide/set {text:"巨兵をトゲの島へ突進させる",x:335,y:71,z:0}
