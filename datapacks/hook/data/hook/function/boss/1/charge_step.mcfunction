#> hook:boss/1/charge_step
# @s = 巨兵、実行位置 = いまの足。0.2 進む(#steps 回)。毎歩トゲを見る(速くても飛び越さない)
execute rotated as @n[type=marker,tag=hook.b1dir] positioned ^ ^ ^1.2 unless block ~ ~1.5 ~ #hook:pass run return run function hook:boss/1/crash
execute rotated as @n[type=marker,tag=hook.b1dir] positioned ^ ^ ^0.2 run tp @s ~ ~ ~
execute at @s if block ~ ~ ~ minecraft:amethyst_cluster run return run function hook:boss/1/hit
scoreboard players remove #steps hook.b1 1
execute if score #steps hook.b1 matches 1.. at @s run function hook:boss/1/charge_step
