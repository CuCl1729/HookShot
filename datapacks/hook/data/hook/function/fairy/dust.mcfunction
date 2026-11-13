#> hook:fairy/dust
# @s = ルミ(実行位置も)。欠片の数で粉の量を増やす
particle minecraft:end_rod ~ ~ ~ 0.08 0.08 0.08 0.005 1
execute if score #shards hook.score matches 1.. run particle minecraft:glow ~ ~ ~ 0.15 0.15 0.15 0 1
execute if score #shards hook.score matches 2.. run particle minecraft:wax_off ~ ~ ~ 0.2 0.2 0.2 0 2
execute if score #shards hook.score matches 3.. run particle minecraft:end_rod ~ ~ ~ 0.25 0.25 0.25 0.02 3
