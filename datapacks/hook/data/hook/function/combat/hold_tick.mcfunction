#> hook:combat/hold_tick
# @s = 掴まれている敵。毎 tick 目の前へ tp して浮かせる。主がスニークしたら放す
execute unless entity @a[tag=hook.owner] run return run function hook:combat/drop
execute if entity @a[tag=hook.owner,tag=hook.sneak_new] run return run function hook:combat/drop
scoreboard players operation @s hook.mv = #mv_t hook.cfg
data modify entity @s Motion set value [0d,0d,0d]
function hook:combat/hold_point with storage hook: cfg
execute at @n[type=marker,tag=hook.hp] run tp @s ~ ~ ~
kill @e[type=marker,tag=hook.hp]
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.4 0.3 0 1 force @a
