#> hook:combat/proj_hit
# @s = 目印 hook.proj。実行位置 = 当たった所(足の高さ)。当たった敵と投げた敵の双方を撃破(ボスは hook:boss/hit)
execute as @e[tag=hook.enemy,tag=!hook.boss,tag=!hook.thrown,tag=!hook.dying,distance=..1.4] at @s run function hook:enemy/kill
execute as @e[tag=hook.boss,tag=!hook.dying,distance=..2.5] at @s run function hook:enemy/kill
execute as @e[tag=hook.thrown] at @s run function hook:combat/slam
kill @s
