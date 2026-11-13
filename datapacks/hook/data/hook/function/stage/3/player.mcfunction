#> hook:stage/3/player
# @s = 天空回廊のプレイヤー(実行位置も)。区画は順不同なので、到着はすべて hook.s3 の一度きりの旗で見る
# 落ちた tick(player/tick が戻した直後で hook.y がまだ ..31)
execute if score @s hook.y matches ..31 run function hook:stage/3/fell
execute unless score #lesson hook.s3 matches 2.. run function hook:stage/3/lesson
# 先回りは状態で止める(離しで飛び越えても): 稽古の前に出発の島 S0(x ..1016)の外へ、鐘3つの前に門の島 G へ来たら戻す
execute unless score #lesson hook.s3 matches 2.. if entity @s[x=1018,y=0,z=-64,dx=300,dy=200,dz=128] run return run function hook:cp/back {t:"まずは稽古。島のゾンビを鉤で縛ってから。"}
execute unless score #bells hook.s3 matches 3 if entity @s[x=1272,y=96,z=-9,dx=24,dy=10,dz=18] run return run function hook:cp/back {t:"風の鐘が三つ鳴るまで、門の島の番兵は来ない。"}
execute unless score #hub hook.s3 matches 1 if entity @s[x=1066,y=70,z=-9,dx=28,dy=5,dz=18] run function hook:stage/3/arrive/hub
execute unless score #hid hook.s3 matches 1 if entity @s[x=1074,y=51,z=-4,dx=8,dy=4,dz=8] run function hook:stage/3/arrive/hidden
execute unless score #nisl hook.s3 matches 1 if entity @s[x=1012,y=109,z=-47,dx=14,dy=5,dz=10] run function hook:stage/3/arrive/n
execute unless score #w1 hook.s3 matches 1 if entity @s[x=1108,y=73,z=-30,dx=12,dy=5,dz=12] run function hook:stage/3/arrive/w1
execute unless score #w2 hook.s3 matches 1 if entity @s[x=1181,y=59,z=-30,dx=10,dy=5,dz=10] run function hook:stage/3/arrive/w2
execute unless score #l3 hook.s3 matches 1 if entity @s[x=1222,y=87,z=-34,dx=4,dy=5,dz=6] run function hook:stage/3/arrive/l3
execute unless score #deck hook.s3 matches 1 if entity @s[x=1204,y=117,z=-38,dx=14,dy=3,dz=10] run function hook:stage/3/arrive/deck
# 崩れ雲(白い羊毛)に立ったら崩落が始まる
execute unless score #chase hook.s3 matches 1.. unless score #sisl hook.s3 matches 1 if entity @s[x=1100,y=60,z=16,dx=72,dy=30,dz=31] if block ~ ~-1 ~ minecraft:white_wool run function hook:stage/3/chase/start
execute unless score #sisl hook.s3 matches 1 if entity @s[x=1180,y=79,z=30,dx=14,dy=5,dz=14] run function hook:stage/3/arrive/s
execute if score #bells hook.s3 matches 3 unless score #mi hook.s3 matches 1 if entity @s[x=1160,y=87,z=-5,dx=10,dy=5,dz=10] run function hook:stage/3/arrive/mi
execute if score #bells hook.s3 matches 3 unless score #g hook.s3 matches 1 if entity @s[x=1272,y=99,z=-9,dx=20,dy=5,dz=18] run function hook:stage/3/arrive/g
execute if score #wave hook.s3 matches 4 if entity @s[x=1293,y=99,z=-3,dx=3,dy=5,dz=6] run function hook:stage/3/finish
