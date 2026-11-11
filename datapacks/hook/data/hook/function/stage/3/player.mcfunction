#> hook:stage/3/player
# @s = 天空回廊のプレイヤー。hook.cp = 30〜36(着いた区画)。門の島 I1 / I5 は、あるかどうかをブロックで見る
# 区画0: 稽古のゾンビ
execute if score @s hook.cp matches 30 if data storage hook: built{s3:1b} unless block 1018 63 0 minecraft:smooth_quartz run function hook:stage/3/lesson
# 各区画に着いたら、チェックポイントと敵(1回ずつ)
execute if score @s hook.cp matches ..30 if entity @s[x=1018,y=63,z=-3,dx=7,dy=6,dz=6] run function hook:stage/3/sec/31
execute if score @s hook.cp matches ..31 if entity @s[x=1070,y=71,z=-4,dx=12,dy=6,dz=8] run function hook:stage/3/sec/32
execute if score @s hook.cp matches ..32 if entity @s[x=1092,y=73,z=-2,dx=6,dy=6,dz=4] run function hook:stage/3/sec/33
execute if score @s hook.cp matches ..33 if entity @s[x=1132,y=75,z=-4,dx=8,dy=6,dz=8] run function hook:stage/3/sec/34
execute if score @s hook.cp matches ..34 if entity @s[x=1150,y=79,z=-4,dx=8,dy=6,dz=8] run function hook:stage/3/sec/35
execute if score @s hook.cp matches ..35 if entity @s[x=1180,y=97,z=-4,dx=4,dy=6,dz=4] run function hook:stage/3/sec/36
# 区画2: W の重装兵が消えたら足場 I5 が出る
execute if score @s hook.cp matches 32 unless entity @e[tag=hook.s3.g] unless block 1092 73 0 minecraft:smooth_quartz run function hook:stage/3/open2
# 門の島 G のアーチをくぐったらステージ4へ
execute if entity @s[x=1231,y=97,z=-5,dx=5,dy=6,dz=10] run function hook:stage/3/finish
