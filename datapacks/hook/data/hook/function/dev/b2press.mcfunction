#> hook:dev/b2press
# 試験用(schedule から毎 tick)。番人がどれかのプレスの下(5x5)にいたら、そのプレスの部屋の中央寄りの標的へプレイヤーが撃つ(人が標的を撃つ操作の代わり)。#trap hook.dev tick まで待つ
scoreboard players remove #trap hook.dev 1
execute if score #trap hook.dev matches ..0 run return run tellraw @a "b2press timeout"
execute in hook:world as @e[type=marker,tag=hook.press,scores={hook.press=0},x=820,y=60,z=-14,dx=44,dy=30,dz=28] at @s positioned ~-2.5 ~-7 ~-2.5 if entity @e[tag=hook.boss2,dx=4,dy=6,dz=4] run tag @s add dev.p
execute unless entity @e[tag=dev.p] run return run schedule function hook:dev/b2press 1t
execute at @e[tag=dev.p,limit=1] as @e[type=marker,tag=hook.switch,distance=..6] run tag @s add dev.c
execute at @e[tag=dev.p,limit=1] positioned ~ ~ 0 as @n[type=marker,tag=dev.c] run tag @s add dev.sw
tag @e[tag=dev.c] remove dev.c
tellraw @a "b2press fire"
execute as @a[limit=1] at @s run function hook:dev/aim_ent {tag:"dev.sw",dy:0}
tag @e[tag=dev.p] remove dev.p
tag @e[tag=dev.sw] remove dev.sw
# 撃ったら 40 tick おいて見張りを続ける(番人を倒すまで #trap の範囲で)
execute if score #state hook.b2 matches 1 run schedule function hook:dev/b2press 40t
