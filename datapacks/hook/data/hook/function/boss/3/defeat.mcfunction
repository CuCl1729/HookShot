#> hook:boss/3/defeat
# @s = 縛られたまま奈落へ落ちた王。後始末をしてエンディングへ(以降 stage/4/tick は呼ばれない)
scoreboard players set #state hook.b3 4
function hook:core/call {f:"hook:boss/3/bar_hide"}
kill @e[tag=hook.b3m]
execute in hook:world run particle minecraft:explosion 1550 64 0 8 4 8 0 40 force @a
execute in hook:world run playsound minecraft:entity.wither.death hostile @a 1550 64 0 4 0.8
tellraw @a[scores={hook.stage=4}] [{text:"[虚の王] ",color:"dark_purple"},{text:"……虚は……虚へ……還る……",color:"gray",italic:true}]
kill @s
execute as @a[scores={hook.stage=4}] run function hook:stage/5/start
