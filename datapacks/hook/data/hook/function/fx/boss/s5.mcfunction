#> hook:fx/boss/s5
# 撃破演出の終わり: 余韻の和音と、静かに降る光。marker を片付ける
execute as @a at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 0.75
execute as @a at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 0.94
execute as @a at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.12
execute as @e[type=marker,tag=hook.fxb] at @s run particle minecraft:end_rod ~ ~8 ~ 5 2 5 0.01 120 force @a
kill @e[type=marker,tag=hook.fxb]
