#> hook:stage/3/start
# @s = プレイヤー。天空回廊の最初へ。何度呼んでも同じ状態に戻す(進行・敵を消し、地形は tick が build で建て直す)
scoreboard players set @s hook.stage 3
# 能力2 まで(ステージ2で得ているはず。ここから直接始めた時のため)
scoreboard players set @s hook.ability 2
tag @s remove hook.grabbed_heavy
tag @s remove hook.yanked
# 進行は全部 hook.s3 の偽プレイヤー(core/reset は知らないのでここで消す)
scoreboard objectives add hook.s3 dummy
scoreboard players reset * hook.s3
scoreboard players set #p2 hook.s3 40
kill @e[tag=hook.s3]
data modify storage hook: built.s3 set value 0b
execute in hook:world run forceload add 1000 -48 1300 47
function hook:cp/set {id:30,x:1004.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
function hook:score/start
function hook:fx/stage_title {name:"第三章 天空回廊",sub:"太陽石の欠片 2/3"}
tellraw @s {text:"最後のひとつは、空の果ての虚の王が持っている。",color:"gray"}
tellraw @s {text:"落ちても戻れるが、敵は奈落に呑まれる。",color:"gray"}
function hook:guide/set {text:"ゾンビにフックを当てる",x:1013.5,y:64,z:0.5}
function hook:fairy/say {text:"空の道だよ。まずは稽古、向かってくるゾンビにフックを当てて、スタンチェインを試そう"}
