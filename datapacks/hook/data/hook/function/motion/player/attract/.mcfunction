tag @s add hook.attract

execute store result score #motion hook.X1 run data get entity @s Pos[0] 100
execute store result score #motion hook.Y1 run data get entity @s Pos[1] 100
execute store result score #motion hook.Z1 run data get entity @s Pos[2] 100

scoreboard players operation #motion hook.X0 = @s hook.X0
scoreboard players operation #motion hook.Y0 = @s hook.Y0
scoreboard players operation #motion hook.Z0 = @s hook.Z0

scoreboard players operation #motion hook.X0 -= #motion hook.X1
scoreboard players operation #motion hook.Y0 -= #motion hook.Y1
scoreboard players operation #motion hook.Z0 -= #motion hook.Z1

scoreboard players operation #motion hook.X0 /= #100 hook.constant
scoreboard players operation #motion hook.Y0 /= #100 hook.constant
scoreboard players operation #motion hook.Z0 /= #100 hook.constant

function hook:motion/player/push