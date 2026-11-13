#> hook:stage/5/start
# @s = 虚の王を倒したプレイヤー(boss/3/defeat から。fx/boss_clear が流れている最中)。その場は動かさず、
# 進めるのは hook:stage/5/tick(#end hook.b3 = 経過 tick)。落ちたら玉座の島 C へ戻る
scoreboard players set @s hook.stage 5
scoreboard players set #end hook.b3 0
scoreboard players set #shot hook.b3 0
scoreboard players set #stump hook.b3 0
scoreboard players set #w hook.b3 0
kill @e[tag=hook.s4,tag=!hook.boss3]
tag @s add hook.cp_quiet
function hook:cp/set {id:50,x:1550.5,y:64,z:0.5,yaw:-90}
tag @s remove hook.cp_quiet
