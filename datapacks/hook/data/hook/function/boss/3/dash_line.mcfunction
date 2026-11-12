#> hook:boss/3/dash_line
# 線を 1 ブロックずつ延ばす(空気でなくなるか 36 で止まる = 突進が止まる所)
particle minecraft:crit ~ ~ ~ 0.1 0 0.1 0 1 force @a
scoreboard players add #i hook.b3 1
execute if score #i hook.b3 matches ..36 if block ~ ~ ~ minecraft:air positioned ^ ^ ^1 run function hook:boss/3/dash_line
