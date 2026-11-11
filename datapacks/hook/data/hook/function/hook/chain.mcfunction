#> hook:hook/chain
# 実行位置 = 目から錨へ向かう線上。鎖のパーティクルを 0.5 ごとに錨まで(最大 #chain 個)
particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force @a
scoreboard players remove #chain hook.temporary 1
execute if score #chain hook.temporary matches 1.. unless entity @n[tag=hook.anchor,distance=..0.6] positioned ^ ^ ^0.5 run function hook:hook/chain
