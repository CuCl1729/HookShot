#> hook:stage/0/build
# 訓練場(hook:world, x -32〜56, z ±8, 床の上面 y=64)。冪等。読み込まれるまでは何もしない(core の tick が毎 tick 呼ぶ)
# A 始まりの台 x -32〜-8 / 谷 x -7〜1 / B 訓練台 x 2〜40(柱 x=5、トゲ x 13〜22、ゾンビの台 x 25〜27)/ 谷 x 41〜51 / C 浮島 x 52〜56
execute in hook:world unless loaded -32 63 -8 run return 0
execute in hook:world unless loaded 20 63 0 run return 0
execute in hook:world unless loaded 56 63 8 run return 0
execute in hook:world run fill -32 63 -8 -8 63 8 minecraft:stone_bricks
execute in hook:world run fill 2 63 -8 40 63 8 minecraft:polished_andesite
execute in hook:world run fill 5 64 -6 5 69 -6 minecraft:chiseled_stone_bricks
execute in hook:world run fill 5 64 -2 5 69 -2 minecraft:chiseled_stone_bricks
execute in hook:world run fill 5 64 2 5 69 2 minecraft:chiseled_stone_bricks
execute in hook:world run fill 5 64 6 5 69 6 minecraft:chiseled_stone_bricks
execute in hook:world run fill 13 63 -8 22 63 8 minecraft:amethyst_block
execute in hook:world run fill 13 64 -8 22 64 8 minecraft:amethyst_cluster
execute in hook:world run fill 25 64 -1 27 67 1 minecraft:stone_bricks
execute in hook:world run fill 52 63 -2 56 63 2 minecraft:stone_bricks
execute unless entity @e[tag=hook.npc] in hook:world positioned -21.5 64 3.5 run function hook:npc/summon
data modify storage hook: built.s0 set value 1b
