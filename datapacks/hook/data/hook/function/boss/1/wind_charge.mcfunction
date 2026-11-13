#> hook:boss/1/wind_charge
# 突進の予告(30 / 24 tick × 難易度)。プレイヤーへ向いた炎の線を出し、残り #lk(14 × 難易度)tick で向きを固定する
execute if score #t hook.b1 > #lk hook.b1 as @n[type=marker,tag=hook.b1dir] run tp @s ~ ~ ~ facing entity @p[scores={hook.stage=1}] feet
execute as @n[type=marker,tag=hook.b1dir] run rotate @s ~ 0
execute at @n[type=marker,tag=hook.b1dir] rotated as @n[type=marker,tag=hook.b1dir] run function hook:boss/1/line
execute if score #t hook.b1 <= #lk hook.b1 run particle minecraft:angry_villager ~ ~4.6 ~ 0.3 0.2 0.3 0 1 force @a
particle minecraft:crit ~ ~2 ~ 0.6 1 0.6 0.1 4 force @a
execute if score #t hook.b1 matches 1.. run return 0
scoreboard players set #st hook.b1 3
scoreboard players set #t hook.b1 45
playsound minecraft:entity.iron_golem.attack hostile @a ~ ~ ~ 2 0.5
