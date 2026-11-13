#> hook:fairy/look
# @s = ルミ(item_display)。欠片の数(#shards hook.score 0〜3)で大きさと姿を変える
execute unless score #shards hook.score matches 1.. run data merge entity @s {item:{id:"minecraft:glowstone_dust",count:1},transformation:{scale:[0.25f,0.25f,0.25f]}}
execute if score #shards hook.score matches 1 run data merge entity @s {item:{id:"minecraft:glowstone_dust",count:1},transformation:{scale:[0.35f,0.35f,0.35f]}}
execute if score #shards hook.score matches 2 run data merge entity @s {item:{id:"minecraft:blaze_powder",count:1},transformation:{scale:[0.45f,0.45f,0.45f]}}
execute if score #shards hook.score matches 3.. run data merge entity @s {item:{id:"minecraft:nether_star",count:1},transformation:{scale:[0.55f,0.55f,0.55f]}}
