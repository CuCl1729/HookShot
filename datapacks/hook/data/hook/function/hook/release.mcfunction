#> hook:hook/release
# @s = プレイヤー。引っ張りをやめる(すぐ次を撃てる)。速度には触らないので、中断・離すと慣性のまま飛ぶ
tag @s remove hook.pulling
tag @s remove hook.arrive
scoreboard players set @s hook.pull 0
kill @e[type=marker,tag=hook.anchor]
tag @e[tag=hook.anchor] remove hook.anchor
kill @e[type=item_display,tag=hook.tip]