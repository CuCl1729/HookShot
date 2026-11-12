#> hook:enemy/tick
# @s = 敵(実行位置も @s)。引き寄せ・掴み → トゲ床・奈落 → スタン → 叩きつけ判定
execute if score @s hook.mv matches 1.. run scoreboard players remove @s hook.mv 1
execute if entity @s[tag=hook.yanking] run return run function hook:combat/yank_tick
execute if entity @s[tag=hook.grabbed] run return run function hook:combat/hold_tick
execute if block ~ ~ ~ minecraft:amethyst_cluster run return run function hook:enemy/gimmick
execute store result score @s hook.y run data get entity @s Pos[1]
execute if score @s hook.y matches ..31 run return run function hook:enemy/kill
execute if score @s hook.stun matches 1.. run function hook:enemy/stun_tick
execute if score @s hook.mv matches 1.. unless entity @s[tag=hook.thrown] unless entity @s[tag=hook.boss] run function hook:combat/slam_check
