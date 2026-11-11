#> hook:stage/1/start
# @s = プレイヤー。水晶坑道の最初へ。何度呼んでも同じ状態に戻す(敵・ボスを消し、地形は tick が建て直す)
scoreboard players set @s hook.stage 1
kill @e[tag=hook.s1]
function hook:boss/1/reset
data remove storage hook: built.s1
execute in hook:world run forceload add 192 0 511 15
function hook:cp/set {id:10,x:202.5,y:64,z:7.5,yaw:-90}
function hook:cp/return
title @s title {text:"第一章 水晶坑道",color:"light_purple"}
title @s subtitle {text:"紫のトゲは、敵だけを貫く",color:"gray"}
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"坑道の奥で水晶を喰らう巨兵が目を覚ました。仲間は皆逃げた。ここから先は、お前のフックだけが頼りだ。",color:"white"}]
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"フックの射程は24マスまで伸ばしておいた。谷の向こうの柱を狙え。",color:"white"}]
