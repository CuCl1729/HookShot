#> hook:stage/2/player
# @s = 歯車工場のプレイヤー(実行位置も)。各エリアに初めて入ったときの案内と敵
# 屋根が無いので、扉が開く前に東の壁(x 789)を越えて前室・ボス部屋へ降りたら戻す
execute if score #door hook.s2 matches 0 if entity @s[x=790,y=40,z=-64,dx=110,dy=80,dz=128] run return run function hook:stage/2/over
# 外壁登り(北の壁沿い z -33.5 まで・東の壁沿い x 784 から、y 88 以上)は床へ下ろす。炉の台 B3 の上(y 104 以上)は除く
execute if entity @s[x=611,y=88,z=-42,dx=178,dy=50,dz=8.5] unless entity @s[x=752,y=104,z=-42,dx=16,dy=40,dz=16] run return run function hook:stage/2/wall {x:"~",z:"-36.5"}
execute if entity @s[x=784,y=88,z=-42,dx=5.5,dy=50,dz=84] run return run function hook:stage/2/wall {x:"786.5",z:"~"}
# B3 の下(足 y 88〜104 未満)。床から跳ね+フロートで B3 の底(y 108)へ届くので、クレーンを経ずに近づいたら下ろす(クレーンの天面は y 104。dy 16 だと y 104 の足も当たり、クレーンから B3 へ引かれた瞬間に下ろされうる)
execute if entity @s[x=744,y=88,z=-42,dx=32,dy=15,dz=20] run return run function hook:stage/2/wall {x:"~",z:"~"}
execute if score #hub hook.s2 matches 0 if entity @s[x=612,y=60,z=-12,dx=16,dy=20,dz=24] run function hook:stage/2/hub
execute if score #ae hook.s2 matches 0 if entity @s[x=640,y=60,z=-40,dx=60,dy=40,dz=26] run function hook:stage/2/a/enter
execute if score #be hook.s2 matches 0 if entity @s[x=745,y=60,z=20,dx=43,dy=60,dz=20] run function hook:stage/2/b/enter
execute if score #cw hook.s2 matches 0 if score #rc hook.s2 matches 0 if entity @s[x=641,y=60,z=15,dx=70,dy=35,dz=24] run function hook:stage/2/c/enter
execute unless score @s hook.cp matches 25 if entity @s[x=805,y=60,z=-6,dx=13,dy=20,dz=12] run function hook:stage/2/fore
