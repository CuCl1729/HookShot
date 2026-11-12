#> hook:boss/3/rest
# 今の行動を終える(途中で怯んだときも)。予告の目印を消し、次の行動まで待つ
scoreboard players set #act hook.b3 0
scoreboard players set #t hook.b3 0
scoreboard players set #cd hook.b3 50
execute if score #state hook.b3 matches 3 run scoreboard players set #cd hook.b3 35
kill @e[tag=hook.b3x]
tag @a remove hook.b3hit
