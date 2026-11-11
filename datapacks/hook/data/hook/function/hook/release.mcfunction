#> hook:hook/release
# @s = プレイヤー。引っ張りをやめる
tag @s remove hook.pulling
scoreboard players set @s hook.pull 0
kill @e[type=marker,tag=hook.anchor]
tag @e[tag=hook.anchor] remove hook.anchor
