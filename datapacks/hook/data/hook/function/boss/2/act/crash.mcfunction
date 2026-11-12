#> hook:boss/2/act/crash
# @s = 壁にぶつかった番人。5 秒動けない
particle minecraft:explosion ~ ~1.5 ~ 0.8 0.8 0.8 0 6 force @a
playsound minecraft:block.anvil.land hostile @a ~ ~ ~ 2 0.5
function hook:boss/2/daze
