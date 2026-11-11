#> hook:boss/3/spawn
# 雑魚(ゾンビとクモを交互)を王の足元に呼ぶ。同時に2体まで。雑魚はトゲ・プレス・奈落で死ぬ(hook:enemy/tick)
scoreboard players set #spawn hook.b3 0
execute store result score #n hook.b3 if entity @e[tag=hook.b3m]
execute if score #n hook.b3 matches 2.. run return 0
scoreboard players add #kind hook.b3 1
execute if score #kind hook.b3 matches 1 at @e[tag=hook.boss3,limit=1] run function hook:enemy/summon/zombie
execute if score #kind hook.b3 matches 2.. at @e[tag=hook.boss3,limit=1] run function hook:enemy/summon/spider
execute if score #kind hook.b3 matches 2.. run scoreboard players set #kind hook.b3 0
tag @e[tag=hook.new] add hook.s4
tag @e[tag=hook.new] add hook.b3m
execute at @e[tag=hook.boss3,limit=1] run particle minecraft:large_smoke ~ ~1 ~ 0.5 0.5 0.5 0.05 20 force @a
execute at @e[tag=hook.boss3,limit=1] run playsound minecraft:entity.evoker.prepare_summon hostile @a ~ ~ ~ 2 0.8
