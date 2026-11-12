#> hook:stage/0/start
# @s = プレイヤー。訓練場の最初へ。地形・扉・敵を建て直す(build は core の tick が built.s0 の無い間呼ぶ)
scoreboard players set @s hook.stage 0
scoreboard players set @s hook.tut 1
scoreboard players set #fl hook.tut 0
scoreboard players set #t hook.tut 0
tag @s remove hook.grabbed_heavy
kill @e[tag=hook.tut]
data remove storage hook: built.s0
execute in hook:world run forceload add -32 -16 95 47
execute in hook:world run tp @e[tag=hook.npc] -24.5 64 2.5 -90 0
function hook:cp/set {id:0,x:-28.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
title @s times 10 60 20
title @s subtitle {text:"太陽石の欠片 0/3",color:"yellow"}
title @s title {text:"訓練場",color:"gold"}
tellraw @s {text:"§e師範§f「太陽石が奪われた。夜が明けん。鉤を持て、使い方を教える」"}
tellraw @s {text:"太陽石の欠片 0/3",color:"yellow"}
function hook:stage/0/talk
