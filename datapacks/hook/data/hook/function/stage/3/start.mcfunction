#> hook:stage/3/start
# @s = プレイヤー。天空回廊の最初へ。何度呼んでもよい(敵を消し、地形と門の島を建て直す)
scoreboard players set @s hook.stage 3
# 能力2 まで(ステージ2で得ているはず。ここから直接始めた時のため)
scoreboard players set @s hook.ability 2
tag @s remove hook.grabbed_heavy
tag @s remove hook.yanked
kill @e[tag=hook.s3]
# 地形は hook:stage/3/tick が読み込み後に建てる
data modify storage hook: built.s3 set value 0b
execute in hook:world run forceload add 1000 -16 1239 15
function hook:cp/set {id:30,x:1002.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
title @s title {text:"天空回廊",color:"gold"}
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"番人を倒したか。ここは天空回廊、かつて王都と玉座を結んだ空の道だ。",color:"white"}]
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"虚の王が玉座を奪った日に道は砕け、島だけが残った。落ちてもお前は戻れるが、敵は奈落に呑まれる。",color:"white"}]
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"番人から得た力、スタンチェインを試せ。向かってくるゾンビにフックを当ててみろ。",color:"white"}]
