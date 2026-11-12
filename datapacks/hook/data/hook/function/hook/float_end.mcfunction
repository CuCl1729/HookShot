#> hook:hook/float_end
# @s = プレイヤー。浮いていたらやめる
execute unless entity @s[tag=hook.floating] run return 0
tag @s remove hook.floating
effect clear @s minecraft:slow_falling
