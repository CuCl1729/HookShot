#> hook:fairy/look
# @s = ルミ(item_display)。欠片の数(#shards hook.score 0〜3)で大きさと姿を変える
execute unless score #shards hook.score matches 1.. run data merge entity @s {item:{id:"minecraft:glowstone_dust",count:1},transformation:{scale:[0.15f,0.15f,0.15f]}}
execute if score #shards hook.score matches 1 run data merge entity @s {item:{id:"minecraft:glowstone_dust",count:1},transformation:{scale:[0.2f,0.2f,0.2f]}}
execute if score #shards hook.score matches 2 run data merge entity @s {item:{id:"minecraft:blaze_powder",count:1},transformation:{scale:[0.25f,0.25f,0.25f]}}
execute if score #shards hook.score matches 3.. run data merge entity @s {item:{id:"minecraft:nether_star",count:1},transformation:{scale:[0.3f,0.3f,0.3f]}}
# 目の前 1.5 に置くので小さめ。以前の肩の上の版(teleport_duration 3)から出ていたルミも追従を速くする
data merge entity @s {teleport_duration:1}
