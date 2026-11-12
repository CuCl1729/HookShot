#> hook:combat/slam
# @s = 壁や敵に高速でぶつかった敵(実行位置はぶつかった所)。叩きつけで撃破(ボスは hook:boss/hit)
particle minecraft:crit ~ ~1 ~ 0.4 0.4 0.4 0.3 20 force @a
playsound minecraft:block.anvil.land hostile @a ~ ~ ~ 0.8 1.4
execute at @s run function hook:enemy/kill
