#> hook:fairy/off
# ルミを消す(全員)。エンディングで太陽石に還るとき・core/reset から。光って消える
execute as @e[type=item_display,tag=hook.fairy] at @s run particle minecraft:end_rod ~ ~ ~ 0.3 0.3 0.3 0.1 40 force @a
execute as @e[type=item_display,tag=hook.fairy] at @s run playsound minecraft:block.amethyst_block.resonate master @a ~ ~ ~ 1 2
tag @a remove hook.lumi
kill @e[type=item_display,tag=hook.fairy]
