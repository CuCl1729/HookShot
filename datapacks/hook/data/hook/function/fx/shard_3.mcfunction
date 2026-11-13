#> hook:fx/shard_3
# fx/shard_get のファンファーレ3音目
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2
execute as @a at @s run playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.5
execute as @a at @s run particle minecraft:end_rod ~ ~1 ~ 1.2 1.2 1.2 0.1 80 force @s
