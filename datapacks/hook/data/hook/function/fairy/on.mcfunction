#> hook:fairy/on
# @s = プレイヤー。ルミを出す(以後 core の tick が肩のあたりへ毎 tick 連れて歩く)
tag @s add hook.lumi
execute at @s run function hook:fairy/spawn
execute at @s run particle minecraft:firework ~ ~2 ~ 0.1 0.1 0.1 0.15 30 force @s
execute at @s run particle minecraft:end_rod ~ ~2 ~ 0.4 0.4 0.4 0.08 40 force @s
execute at @s run playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.6
execute at @s run playsound minecraft:entity.allay.item_given master @s ~ ~ ~ 1 1.2
