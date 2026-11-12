#> hook:boss/1/wind_rain
# 水晶落としの予告(30 / 24 tick)→ 落下
execute as @e[type=marker,tag=hook.b1rain] at @s run particle minecraft:end_rod ~ ~0.1 ~ 0.9 0 0.9 0 3 force @a
execute as @e[type=marker,tag=hook.b1rain] at @s run particle minecraft:crit ~ ~8 ~ 0.6 3 0.6 0 2 force @a
execute if score #t hook.b1 matches 1.. run return 0
execute as @e[type=marker,tag=hook.b1rain] at @s run function hook:boss/1/rain_hit
function hook:boss/1/idle
