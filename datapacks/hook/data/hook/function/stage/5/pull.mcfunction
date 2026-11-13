#> hook:stage/5/pull
# @s = 鉤に引かれて飛んでくる最後の欠片(item_display hook.s5f。hook.b3x も付けてあるので boss/3/reset が片付ける)。いちばん近いプレイヤーの胸元へ 1.8 ブロック/tick、着いたら消える
particle minecraft:end_rod ~ ~ ~ 0.15 0.15 0.15 0.01 4 force @a
particle minecraft:electric_spark ~ ~ ~ 0.3 0.3 0.3 0 3 force @a
execute if entity @a[scores={hook.stage=5},distance=..2.5] run return run kill @s
execute facing entity @p[scores={hook.stage=5}] eyes run tp @s ^ ^ ^1.8
