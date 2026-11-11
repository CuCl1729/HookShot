#> hook:boss/2/stagger
# @s = 突き飛ばされた番人。3秒よろける
tag @s remove hook.impacted
effect give @s minecraft:slowness 3 255 true
particle minecraft:electric_spark ~ ~2 ~ 0.6 0.6 0.6 0 30 force @a
playsound minecraft:block.anvil.place hostile @a ~ ~ ~ 1 0.5
