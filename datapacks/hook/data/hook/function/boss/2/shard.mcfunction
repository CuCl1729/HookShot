#> hook:boss/2/shard
# @s = 欠片の標的のスイッチ(hook:hook/switch から)。欠片が手元へ飛んで 2/3(post の #t が 81 から進む)
execute unless score #state hook.b2 matches 2 run return 0
execute if score #got hook.b2 matches 1 run return 0
scoreboard players set #got hook.b2 1
kill @e[tag=hook.b2s]
execute in hook:world run fill 840 76 -1 842 79 1 minecraft:air
# 欠片が飛んでくる軌跡
execute as @a[scores={hook.stage=2}] at @s facing 841.5 78 0.5 run particle minecraft:end_rod ^ ^1.5 ^2 0.2 0.2 0.2 0.15 60 force @a
execute in hook:world run particle minecraft:end_rod 841.5 78 0.5 1 1 1 0.3 100 force @a
playsound minecraft:block.beacon.power_select master @a ~ ~ ~ 4 1.2
function hook:fx/shard_get {n:2}
