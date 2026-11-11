#> hook:stage/2/player
# @s = 歯車工場のプレイヤー(実行位置も)。部屋に入るたびにチェックポイントと敵。hook.cp 20〜25
execute if data storage hook: built{s2:1b} unless data storage hook: s2{r1:1b} run function hook:stage/2/room/1
execute if score @s hook.cp matches 20 if entity @s[x=646,y=60,z=-9,dx=44,dy=20,dz=18] run function hook:stage/2/room/2
execute if score @s hook.cp matches 21 if entity @s[x=692,y=60,z=-4,dx=4,dy=20,dz=8] run function hook:stage/2/room/3
execute if score @s hook.cp matches 22 if entity @s[x=735,y=60,z=-7,dx=40,dy=20,dz=14] run function hook:stage/2/room/4
execute if score @s hook.cp matches 23 if entity @s[x=783,y=66,z=-3,dx=4,dy=14,dz=6] run function hook:stage/2/room/5
execute if score @s hook.cp matches 24 if entity @s[x=805,y=72,z=-6,dx=13,dy=18,dz=12] run function hook:stage/2/room/6
# 門: その部屋の敵が全滅したら開く
execute if data storage hook: s2{r1:1b} unless entity @e[tag=hook.s2r1] if block 645 64 0 minecraft:iron_bars run function hook:stage/2/gate {x:645}
execute if score @s hook.cp matches 21.. unless entity @e[tag=hook.s2r2] if block 691 64 0 minecraft:iron_bars run function hook:stage/2/gate {x:691}
