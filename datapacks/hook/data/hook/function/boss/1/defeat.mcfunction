#> hook:boss/1/defeat
# @s = HP が尽きた巨兵。膝をつかせて撃破演出へ(#st 9。続きは hook:boss/1/end)
scoreboard players set #st hook.b1 9
scoreboard players set #dt hook.b1 0
function hook:score/stop
function hook:core/call {f:"hook:boss/1/bar_hide"}
kill @e[tag=hook.s1m1]
kill @e[tag=hook.s1m2]
kill @e[type=marker,tag=hook.b1dir]
tag @s remove hook.enemy
tag @s remove hook.boss
tag @s remove hook.heavy
data merge entity @s {NoAI:1b}
tp @s ~ ~-0.6 ~
particle minecraft:explosion ~ ~2 ~ 1 1.5 1 0 12 force @a
particle minecraft:end_rod ~ ~2.5 ~ 0.4 0.4 0.4 0.1 40 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.8
playsound minecraft:block.amethyst_block.resonate hostile @a ~ ~ ~ 2 0.4
