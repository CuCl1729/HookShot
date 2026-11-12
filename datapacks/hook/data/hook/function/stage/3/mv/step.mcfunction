#> hook:stage/3/mv/step
# in hook:world。動く錨 M1(x 1134)と M2(x 1164)、3x3 の金の板が y 53〜94 を逆位相で上下する(#p 0〜79 の三角波)
# 板の柱(x±5, z -30〜-18)にプレイヤーかフックの錨がある間は、その板は止まる(人に食い込まない・掴んだ錨が逃げない)
execute unless entity @a[x=1129,y=40,z=-30,dx=10,dy=80,dz=12] unless entity @e[tag=hook.anchor,x=1129,y=40,z=-30,dx=10,dy=80,dz=12] run scoreboard players add #p1 hook.s3 1
execute unless entity @a[x=1159,y=40,z=-30,dx=10,dy=80,dz=12] unless entity @e[tag=hook.anchor,x=1159,y=40,z=-30,dx=10,dy=80,dz=12] run scoreboard players add #p2 hook.s3 1
execute if score #p1 hook.s3 matches 80.. run scoreboard players set #p1 hook.s3 0
execute if score #p2 hook.s3 matches 80.. run scoreboard players set #p2 hook.s3 0
scoreboard players operation #o hook.s3 = #p1 hook.s3
function hook:stage/3/mv/y
data modify storage hook: s3m.x set value 1134
function hook:stage/3/mv/place with storage hook: s3m
scoreboard players operation #o hook.s3 = #p2 hook.s3
function hook:stage/3/mv/y
data modify storage hook: s3m.x set value 1164
function hook:stage/3/mv/place with storage hook: s3m
