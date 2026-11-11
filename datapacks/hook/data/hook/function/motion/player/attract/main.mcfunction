
execute store result score #motion hook.X1 run data get entity @s Pos[0] 100
execute store result score #motion hook.Y1 run data get entity @s Pos[1] 100
execute store result score #motion hook.Z1 run data get entity @s Pos[2] 100

scoreboard players operation #motion hook.X0 = @s hook.X0
scoreboard players operation #motion hook.Y0 = @s hook.Y0
scoreboard players operation #motion hook.Z0 = @s hook.Z0

scoreboard players operation #motion hook.X0 -= #motion hook.X1
scoreboard players operation #motion hook.Y0 -= #motion hook.Y1
scoreboard players operation #motion hook.Z0 -= #motion hook.Z1

scoreboard players operation #motion hook.X0 /= #10 hook.constant
scoreboard players operation #motion hook.Y0 /= #100 hook.constant
scoreboard players operation #motion hook.Z0 /= #10 hook.constant

scoreboard players operation #motion hook.X0 /= #7 hook.constant
scoreboard players operation #motion hook.Y0 /= #2 hook.constant
scoreboard players operation #motion hook.Z0 /= #7 hook.constant

execute if score #motion hook.X0 matches -10..10 run scoreboard players set #motion hook.X0 0
execute if score #motion hook.Y0 matches -10..10 run scoreboard players set #motion hook.Y0 0
execute if score #motion hook.Z0 matches -10..10 run scoreboard players set #motion hook.Z0 0

execute if score #motion hook.X0 matches 0 run scoreboard players set #motion hook.X0 1
execute if score #motion hook.Y0 matches 0 run scoreboard players set #motion hook.Y0 1
execute if score #motion hook.Z0 matches 0 run scoreboard players set #motion hook.Z0 1

scoreboard players operation #motion hook.temporary = #motion hook.X0
scoreboard players operation #motion hook.temporary *= #motion hook.Y0
scoreboard players operation #motion hook.temporary *= #motion hook.Z0
scoreboard players operation #motion hook.temporary /= #power hook.multiplier

execute if score #motion hook.temporary matches -10..10 run tag @s remove hook.attract

function hook:motion/player/push