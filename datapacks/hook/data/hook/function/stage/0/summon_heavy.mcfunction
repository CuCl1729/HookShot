#> hook:stage/0/summon_heavy
# @s = プレイヤー。浮島 C に訓練用の重装兵(動かない)を出す
tag @s remove hook.grabbed_heavy
execute in hook:world positioned 54.5 64 0.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.tut
execute as @e[tag=hook.new] run data modify entity @s NoAI set value 1b
