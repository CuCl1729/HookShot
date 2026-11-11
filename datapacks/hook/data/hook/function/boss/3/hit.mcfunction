#> hook:boss/3/hit
# @s = ギミックに触れた虚の王(実行位置も)。hook:boss/hit から毎 tick 来うる。
# 見分け: y<32 = 奈落 / 足元に amethyst_cluster = トゲ / それ以外 = プレス(hook.y は enemy/tick が直前に入れている)
execute if score @s hook.y matches ..31 run return run function hook:boss/3/fall
execute if score #inv hook.b3 matches 1.. run return 0
execute if score #state hook.b3 matches 1 if block ~ ~ ~ minecraft:amethyst_cluster run return run function hook:boss/3/p1_spike
execute if score #state hook.b3 matches 1 run return run function hook:boss/3/p1_press
execute if score #state hook.b3 matches 3 run function hook:boss/3/p2_hit
