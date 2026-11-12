#> hook:boss/3/dash_step
# @s = 突進中の王(実行の向き = 突進の向き)。前が塞がっていれば止まる。進んで、触れたプレイヤーに一度だけ傷
execute unless block ^ ^0.5 ^1.6 minecraft:air run return run function hook:boss/3/rest
execute unless block ^ ^2 ^1.6 minecraft:air run return run function hook:boss/3/rest
tp @s ^ ^ ^1.2
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
execute at @s run particle minecraft:large_smoke ~ ~1 ~ 0.4 0.6 0.4 0.02 4 force @a
execute at @s as @a[scores={hook.stage=4},distance=..2.6,tag=!hook.b3hit] run function hook:boss/3/dash_hit
