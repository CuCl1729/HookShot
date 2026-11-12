#> hook:boss/3/dazed
# hook:world。怯み中の毎 tick(攻撃しない)
scoreboard players remove #stag hook.b3 1
execute at @e[tag=hook.boss3] run particle minecraft:electric_spark ~ ~4.3 ~ 0.5 0.1 0.5 0 2 force @a
execute if score #stag hook.b3 matches 0 run scoreboard players set #cd hook.b3 30
execute if score #stag hook.b3 matches 0 run scoreboard players set #grd hook.b3 150
