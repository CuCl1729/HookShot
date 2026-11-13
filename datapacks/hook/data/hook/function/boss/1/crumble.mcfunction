#> hook:boss/1/crumble
# @s = 膝をついた巨兵(実行位置も)。砕けて消える
particle minecraft:explosion ~ ~2 ~ 1 1.5 1 0 12 force @a
particle minecraft:end_rod ~ ~2.5 ~ 1 1.5 1 0.2 80 force @a
particle minecraft:electric_spark ~ ~2 ~ 1 1.5 1 0.4 60 force @a
playsound minecraft:block.amethyst_cluster.break hostile @a ~ ~ ~ 2 0.5
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 1.5 0.8
kill @s
