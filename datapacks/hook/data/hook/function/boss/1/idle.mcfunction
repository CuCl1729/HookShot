#> hook:boss/1/idle
# 技の後の間合い(第2段階は短い)
scoreboard players set #st hook.b1 1
scoreboard players set #t hook.b1 25
execute if score #ph hook.b1 matches 2 run scoreboard players set #t hook.b1 15
kill @e[type=marker,tag=hook.b1dir]
