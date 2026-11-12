#> hook:dev/rec_start
# @s = プレイヤー。動きの記録を始める(着地で hook:dev/report が出す)
execute store result score #rec_x0 hook.temporary run data get entity @s Pos[0] 100
execute store result score #rec_y0 hook.temporary run data get entity @s Pos[1] 100
execute store result score #rec_z0 hook.temporary run data get entity @s Pos[2] 100
scoreboard players operation #rec_pk hook.temporary = #rec_y0 hook.temporary
scoreboard players set #rec_ay hook.temporary -999999
scoreboard players set #rec_pk2 hook.temporary -999999
scoreboard players set #rec_ax hook.temporary 0
scoreboard players set #rec_az hook.temporary 0
scoreboard players set #rec_t hook.temporary 0
scoreboard players set #rec_g hook.temporary 0
scoreboard players set #rec_f hook.temporary 0
scoreboard players set #rec_n hook.temporary 0
tag @s add hook.rec
