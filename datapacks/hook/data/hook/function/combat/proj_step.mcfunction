#> hook:combat/proj_step
# @s = 目印 hook.proj(位置 = 敵の体の中心)。0.5 先が 標的 → 作動 / ブロック → 壁 / 他の敵 → 双方撃破。無ければ進む
execute positioned ^ ^ ^0.5 if block ~ ~ ~ minecraft:target run return run function hook:combat/proj_switch
execute positioned ^ ^ ^0.5 positioned ~ ~-0.8 ~ if block ~ ~ ~ minecraft:target run return run function hook:combat/proj_switch
execute positioned ^ ^ ^0.5 unless block ~ ~ ~ #hook:pass run return run function hook:combat/proj_wall
execute positioned ^ ^ ^0.5 unless block ~ ~-0.8 ~ #hook:pass run return run function hook:combat/proj_wall
execute positioned ^ ^ ^0.5 positioned ~ ~-0.9 ~ if entity @e[tag=hook.enemy,tag=!hook.thrown,tag=!hook.dying,distance=..1.4] run return run function hook:combat/proj_hit
execute positioned ^ ^ ^0.5 positioned ~ ~-0.9 ~ if entity @e[tag=hook.boss,tag=!hook.dying,distance=..2.5] run return run function hook:combat/proj_hit
tp @s ^ ^ ^0.5
execute at @s as @e[tag=hook.thrown] run tp @s ~ ~-0.9 ~
scoreboard players remove #steps hook.temporary 1
execute if score #steps hook.temporary matches 1.. at @s run function hook:combat/proj_step
