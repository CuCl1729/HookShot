#> hook:boss/3/warp
# @s = 王(実行位置も)。地面に立っているプレイヤーの位置へ渡る(空中のプレイヤーには行かない)
execute unless entity @p[scores={hook.stage=4},nbt={OnGround:1b}] run return 0
particle minecraft:large_smoke ~ ~1 ~ 0.5 1 0.5 0.05 30 force @a
tp @s @p[scores={hook.stage=4},nbt={OnGround:1b}]
# 現れて2秒は動かず殴らない(逃げるかフックで縛る猶予。真上に出て即座に殴られると理不尽なので)
effect give @s minecraft:slowness 2 255 true
effect give @s minecraft:weakness 2 255 true
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.5 1 0.5 0.5 60 force @a
execute at @s run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 2 0.5
