#> hook:combat/proj_wall
# @s = 目印 hook.proj。壁に高速で当たった → 投げた敵を撃破
execute as @e[tag=hook.thrown] at @s run function hook:combat/slam
kill @s
