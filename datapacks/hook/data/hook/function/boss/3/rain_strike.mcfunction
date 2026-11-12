#> hook:boss/3/rain_strike
# @s = 虚の雨の目印(実行位置も)。落ちて、円の中のプレイヤーに傷
particle minecraft:explosion ~ ~0.5 ~ 1 0.3 1 0 4 force @a
particle minecraft:end_rod ~ ~3 ~ 0.5 3 0.5 0.02 30 force @a
playsound minecraft:entity.evoker_fangs.attack hostile @a ~ ~ ~ 2 0.7
execute positioned ~-2.5 ~-2 ~-2.5 as @a[scores={hook.stage=4},dx=4,dy=12,dz=4] run function hook:core/call {f:"hook:boss/3/hurt"}
