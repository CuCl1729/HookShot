#> hook:player/vel
# @s = プレイヤー。#x1/#y1/#z1 = いまの位置、#vx/#vy/#vz = 前 tick からの移動(= いまの速度。×100)
# (サーバーはプレイヤーの Motion を正しく持たないので位置の差で測る)
execute store result score #x1 hook.temporary run data get entity @s Pos[0] 100
execute store result score #y1 hook.temporary run data get entity @s Pos[1] 100
execute store result score #z1 hook.temporary run data get entity @s Pos[2] 100
scoreboard players operation #vx hook.temporary = #x1 hook.temporary
scoreboard players operation #vy hook.temporary = #y1 hook.temporary
scoreboard players operation #vz hook.temporary = #z1 hook.temporary
scoreboard players operation #vx hook.temporary -= @s hook.px
scoreboard players operation #vy hook.temporary -= @s hook.py
scoreboard players operation #vz hook.temporary -= @s hook.pz
scoreboard players operation @s hook.px = #x1 hook.temporary
scoreboard players operation @s hook.py = #y1 hook.temporary
scoreboard players operation @s hook.pz = #z1 hook.temporary
# テレポート直後の位置の差は速度ではない(5 ブロック/tick 超は 0 とみなす。打ち消しで空へ打ち上げないように)
execute unless score #vx hook.temporary matches -500..500 run function hook:player/vel_reset
execute unless score #vy hook.temporary matches -500..500 run function hook:player/vel_reset
execute unless score #vz hook.temporary matches -500..500 run function hook:player/vel_reset
# 押す直前の実際の速度 #cx/#cy/#cz = 移動後に空気抵抗(横 ×0.91、縦 (v−0.08)×0.98)がかかった値。速度を打ち消すときはこれを引く
scoreboard players operation #cx hook.temporary = #vx hook.temporary
scoreboard players operation #cz hook.temporary = #vz hook.temporary
scoreboard players operation #cx hook.temporary *= #91 hook.constant
scoreboard players operation #cz hook.temporary *= #91 hook.constant
scoreboard players operation #cx hook.temporary /= #100 hook.constant
scoreboard players operation #cz hook.temporary /= #100 hook.constant
scoreboard players operation #cy hook.temporary = #vy hook.temporary
scoreboard players remove #cy hook.temporary 8
scoreboard players operation #cy hook.temporary *= #98 hook.constant
scoreboard players operation #cy hook.temporary /= #100 hook.constant
