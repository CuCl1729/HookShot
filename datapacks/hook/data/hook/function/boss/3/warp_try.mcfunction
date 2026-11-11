#> hook:boss/3/warp_try
scoreboard players set #warp hook.b3 0
execute as @e[tag=hook.boss3,tag=!hook.stun] at @s unless entity @a[scores={hook.stage=4},distance=..8] run function hook:boss/3/warp
