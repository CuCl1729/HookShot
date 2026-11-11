#> hook:stage/1/player
# @s = 水晶坑道のプレイヤー(実行位置も @s)。hook.cp = 10(R1)〜16(R7)、17(闘技場の入口)
# 部屋に入ったら、一度だけチェックポイントと敵を置く
execute if score @s hook.cp matches ..10 if entity @s[x=240,y=56,z=0,dx=4,dy=24,dz=16] run function hook:stage/1/room/2
execute if score @s hook.cp matches ..11 if entity @s[x=280,y=56,z=0,dx=4,dy=24,dz=16] run function hook:stage/1/room/3
execute if score @s hook.cp matches ..12 if entity @s[x=320,y=56,z=0,dx=4,dy=24,dz=16] run function hook:stage/1/room/4
execute if score @s hook.cp matches ..13 if entity @s[x=360,y=56,z=0,dx=4,dy=24,dz=16] run function hook:stage/1/room/5
execute if score @s hook.cp matches ..14 if entity @s[x=410,y=56,z=0,dx=4,dy=24,dz=16] run function hook:stage/1/room/6
execute if score @s hook.cp matches ..15 if entity @s[x=450,y=56,z=0,dx=3,dy=24,dz=16] run function hook:stage/1/room/7
execute if score @s hook.cp matches ..16 if entity @s[x=460,y=56,z=0,dx=3,dy=24,dz=16] run function hook:stage/1/room/8
# 部屋の敵が全滅したら出口の格子を開ける
execute if score @s hook.cp matches 11 unless entity @e[tag=hook.s1r2] if block 278 64 7 minecraft:iron_bars run function hook:stage/1/gate {x:278}
execute if score @s hook.cp matches 13 unless entity @e[tag=hook.s1r4] if block 358 64 7 minecraft:iron_bars run function hook:stage/1/gate {x:358}
execute if score @s hook.cp matches 15 unless entity @e[tag=hook.s1r6] if block 448 64 7 minecraft:iron_bars run function hook:stage/1/gate {x:448}
# 闘技場の奥へ踏み込んだらボス戦(死亡・落下で入口へ戻ると hook:boss/1/tick がやり直しにする)
execute if score @s hook.cp matches 17 unless entity @e[tag=hook.boss1] if entity @s[x=466,y=56,z=0,dx=34,dy=24,dz=16] run function hook:boss/1/start
