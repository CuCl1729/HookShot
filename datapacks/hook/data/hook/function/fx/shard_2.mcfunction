#> hook:fx/shard_2
# fx/shard_get のファンファーレ2音目(schedule。実行者なしなので @a から)
execute as @a at @s run playsound minecraft:block.note_block.bell master @s ~ ~ ~ 1 1.0
execute as @a at @s run playsound minecraft:block.note_block.bell master @s ~ ~ ~ 1 1.26
execute as @a at @s run playsound minecraft:block.note_block.bell master @s ~ ~ ~ 1 1.5
execute as @e[type=item_display,tag=hook.fairy] at @s run particle minecraft:firework ~ ~ ~ 0.1 0.1 0.1 0.2 40 force @a
