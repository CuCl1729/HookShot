#> hook:stage/5/start
# @s = 虚の王を倒したプレイヤー。床を元に戻し、玉座の島でエンディング(進めるのは hook:stage/5/tick)
scoreboard players set @s hook.stage 5
scoreboard players set #end hook.b3 0
scoreboard players set #shot hook.b3 0
scoreboard players set #stump hook.b3 0
scoreboard players set #w hook.b3 0
kill @e[tag=hook.s4]
execute in hook:world run function hook:stage/4/build
function hook:cp/set {id:50,x:1550.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
