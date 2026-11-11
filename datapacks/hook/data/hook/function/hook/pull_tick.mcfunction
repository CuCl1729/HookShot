#> hook:hook/pull_tick
# @s = 引っ張られているプレイヤー(実行位置も @s)。
# いまの速度 = 前 tick からの位置の差(サーバーはプレイヤーの Motion を正しく持たないため)。
# 望む速度 = (錨 − 位置) / 4(各軸 ±1.5 ブロック/tick まで)。その差を hook:motion/player/push で足す
scoreboard players remove @s hook.pull 1
execute unless entity @e[tag=hook.anchor] run return run function hook:hook/release
execute if score @s hook.pull matches ..0 run return run function hook:hook/release

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

execute if entity @e[tag=hook.anchor,distance=..1.8] run return run function hook:hook/arrive

scoreboard players set #chain hook.temporary 48
execute anchored eyes positioned ^ ^ ^ facing entity @n[tag=hook.anchor] feet run function hook:hook/chain

execute store result score #motion hook.X0 run data get entity @n[tag=hook.anchor] Pos[0] 100
execute store result score #motion hook.Y0 run data get entity @n[tag=hook.anchor] Pos[1] 100
execute store result score #motion hook.Z0 run data get entity @n[tag=hook.anchor] Pos[2] 100
# 重い敵へは足元の1上を目指す(足元の高さだと、敵の立つ台の側面に引っかかって落ちる)
execute if entity @n[tag=hook.anchor,type=!marker] run scoreboard players add #motion hook.Y0 100
scoreboard players operation #motion hook.X0 -= #x1 hook.temporary
scoreboard players operation #motion hook.Y0 -= #y1 hook.temporary
scoreboard players operation #motion hook.Z0 -= #z1 hook.temporary
scoreboard players operation #motion hook.X0 /= #4 hook.constant
scoreboard players operation #motion hook.Y0 /= #4 hook.constant
scoreboard players operation #motion hook.Z0 /= #4 hook.constant
# shortcut: 軸ごとに上限をかけるので斜めは少し向きがずれる。気になったらベクトル長で割る形にする
execute if score #motion hook.X0 matches 151.. run scoreboard players set #motion hook.X0 150
execute if score #motion hook.X0 matches ..-151 run scoreboard players set #motion hook.X0 -150
execute if score #motion hook.Y0 matches 151.. run scoreboard players set #motion hook.Y0 150
execute if score #motion hook.Y0 matches ..-151 run scoreboard players set #motion hook.Y0 -150
execute if score #motion hook.Z0 matches 151.. run scoreboard players set #motion hook.Z0 150
execute if score #motion hook.Z0 matches ..-151 run scoreboard players set #motion hook.Z0 -150
scoreboard players operation #motion hook.X0 -= #vx hook.temporary
scoreboard players operation #motion hook.Y0 -= #vy hook.temporary
scoreboard players operation #motion hook.Z0 -= #vz hook.temporary
function hook:motion/player/push
