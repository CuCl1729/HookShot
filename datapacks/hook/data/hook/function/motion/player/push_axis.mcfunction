#> hook:motion/player/push_axis
# @s = プレイヤー。@macro tag: 視点の軸の目印 / out: 結果を入れるスコア。
# 目印 − 原点(×1000)= その軸の単位ベクトル。速度(#motion hook.X0/Y0/Z0)との内積を @s の out に入れる
$execute store result score #push_ax hook.temporary run data get entity @n[type=marker,tag=$(tag)] Pos[0] 1000
$execute store result score #push_ay hook.temporary run data get entity @n[type=marker,tag=$(tag)] Pos[1] 1000
$execute store result score #push_az hook.temporary run data get entity @n[type=marker,tag=$(tag)] Pos[2] 1000
scoreboard players operation #push_ax hook.temporary -= #push_ox hook.temporary
scoreboard players operation #push_ay hook.temporary -= #push_oy hook.temporary
scoreboard players operation #push_az hook.temporary -= #push_oz hook.temporary
scoreboard players operation #push_ax hook.temporary *= #motion hook.X0
scoreboard players operation #push_ay hook.temporary *= #motion hook.Y0
scoreboard players operation #push_az hook.temporary *= #motion hook.Z0
scoreboard players operation #push_ax hook.temporary += #push_ay hook.temporary
scoreboard players operation #push_ax hook.temporary += #push_az hook.temporary
scoreboard players operation #push_ax hook.temporary /= #1000 hook.constant
$scoreboard players operation @s $(out) = #push_ax hook.temporary
