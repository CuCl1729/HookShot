#> hook:boss/1/wind_stomp
# 踏みつけの予告(30 tick)→ 半径 14 の床の上(足が y 73 未満)にいるプレイヤーに傷
particle minecraft:crit ~ ~0.2 ~ 7 0 7 0 20 force @a
particle minecraft:end_rod ~ ~4.6 ~ 0.3 0.3 0.3 0 2 force @a
execute if score #t hook.b1 matches 1.. run return 0
particle minecraft:explosion ~ ~0.5 ~ 7 0.2 7 0 40 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.5
execute as @a[scores={hook.stage=1},x=311,y=60,z=-20,dx=48,dy=12,dz=40,distance=..14] run damage @s 7 minecraft:mob_attack by @n[tag=hook.boss1]
function hook:boss/1/idle
