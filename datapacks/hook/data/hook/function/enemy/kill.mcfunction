#> hook:enemy/kill
# @s = ギミックに触れた敵(実行位置も @s)。ボスは hook:boss/hit に回す
execute if entity @s[tag=hook.boss] run return run function hook:boss/hit
particle minecraft:explosion ~ ~0.5 ~ 0 0 0 0 1 force @a
playsound minecraft:entity.generic.hurt hostile @a ~ ~ ~ 1 0.6
kill @s
