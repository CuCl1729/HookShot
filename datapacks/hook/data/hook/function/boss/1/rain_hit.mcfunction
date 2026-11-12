#> hook:boss/1/rain_hit
# @s = 落ちる所の目印。輪(3x3)の真上にいるプレイヤーは高さに関係なく当たる
particle minecraft:explosion ~ ~0.5 ~ 0.6 0.3 0.6 0 3 force @a
playsound minecraft:block.amethyst_cluster.break hostile @a ~ ~ ~ 1.5 0.7
execute positioned ~-1.5 60 ~-1.5 as @a[scores={hook.stage=1},dx=2,dy=44,dz=2] run damage @s 5 minecraft:mob_attack by @n[tag=hook.boss1]
kill @s
