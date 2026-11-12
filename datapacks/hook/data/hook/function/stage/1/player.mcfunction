#> hook:stage/1/player
# @s = 水晶坑道のプレイヤー(実行位置も @s、hook:world)。区画に初めて入ったら敵とチェックポイントを置く。鍵・光の粒は 2.5 以内で拾う
execute if score #hub hook.s1 matches 0 if entity @s[x=211,y=50,z=-19,dx=38,dy=62,dz=38] run function hook:stage/1/arrive/hub
execute if score #a hook.s1 matches 0 if entity @s[x=222,y=50,z=-40,dx=16,dy=62,dz=18] run function hook:stage/1/arrive/a
execute if score #bw hook.s1 matches 0 if entity @s[x=212,y=70,z=31,dx=36,dy=22,dz=30] run function hook:stage/1/arrive/b
execute if score #c hook.s1 matches 0 if entity @s[x=259,y=70,z=-6,dx=38,dy=24,dz=32] run function hook:stage/1/arrive/c
execute if score #ante hook.s1 matches 0 if entity @s[x=300,y=96,z=-3,dx=9,dy=6,dz=6] run function hook:stage/1/arrive/ante
execute as @e[type=item_display,tag=hook.s1key,distance=..2.5] at @s run function hook:stage/1/key
execute as @e[type=item_display,tag=hook.s1lore,distance=..2.5] at @s run function hook:lore/pick
execute if score #keys hook.s1 matches 3.. if score #gate hook.s1 matches 0 run function hook:stage/1/gate
# 闘技場の箱に入ったらボス戦(死亡・落下で前室へ戻ると hook:boss/1/tick がやり直しにする)
execute if score #st hook.b1 matches 0 if entity @s[x=311,y=60,z=-20,dx=48,dy=43,dz=40] run function hook:boss/1/start
