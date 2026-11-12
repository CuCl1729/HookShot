#> hook:stage/2/b/crane
# hook:world で 8 tick ごと。クレーンの台(3x2x3 の実ブロック。フックが当たる)を z に 1 マス動かす。
# 中心 z 20〜-18 を往復(hook.s2fwd = 北 -z へ)。台は実行位置ごと消して描き直す。乗っていても運ばれない(乗り継ぎ専用)
scoreboard players set #kt hook.s2 0
execute as @e[type=marker,tag=hook.s2crane] at @s if entity @s[z=-30,dz=12.6] run tag @s remove hook.s2fwd
execute as @e[type=marker,tag=hook.s2crane] at @s if entity @s[z=19.4,dz=10] run tag @s add hook.s2fwd
execute as @e[type=marker,tag=hook.s2crane,tag=hook.s2fwd] at @s run tp @s ~ ~ ~-1
execute as @e[type=marker,tag=hook.s2crane,tag=!hook.s2fwd] at @s run tp @s ~ ~ ~1
fill 759 102 -20 761 103 22 minecraft:air
execute at @e[type=marker,tag=hook.s2crane] run fill ~-1 ~ ~-1 ~1 ~1 ~1 minecraft:yellow_concrete
execute at @e[type=marker,tag=hook.s2crane] as @e[type=block_display,tag=hook.s2chain] run tp @s ~-0.5 ~2 ~-0.5
