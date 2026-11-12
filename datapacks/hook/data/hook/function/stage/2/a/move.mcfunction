#> hook:stage/2/a/move
# @s = 炉心の台車(block_display、位置 = 底面の中心)。レール x 645.5〜675.5 を 0.05 ブロック/tick で往復(プレスの範囲 5 マスを 5 秒で通る)
execute if entity @s[tag=hook.s2fwd] run tp @s ~0.05 ~ ~
execute unless entity @s[tag=hook.s2fwd] run tp @s ~-0.05 ~ ~
execute if entity @s[x=675.5,y=60,z=-32,dx=10,dy=10,dz=10] run tag @s remove hook.s2fwd
execute if entity @s[x=630,y=60,z=-32,dx=15.5,dy=10,dz=10] run tag @s add hook.s2fwd
particle minecraft:flame ~ ~2.1 ~ 0.4 0 0.4 0 1 force @a
