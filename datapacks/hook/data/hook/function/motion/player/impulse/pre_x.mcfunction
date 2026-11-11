scoreboard players operation #motion hook.temporary = @s hook.impulse.x

scoreboard players set #-1 hook.X0 0
scoreboard players set #1 hook.X0 0
scoreboard players set #2 hook.X0 0
scoreboard players set #4 hook.X0 0
scoreboard players set #8 hook.X0 0
scoreboard players set #16 hook.X0 0
scoreboard players set #32 hook.X0 0
scoreboard players set #64 hook.X0 0
scoreboard players set #128 hook.X0 0
scoreboard players set #256 hook.X0 0
scoreboard players set #512 hook.X0 0
scoreboard players set #1024 hook.X0 0
scoreboard players set #2048 hook.X0 0
scoreboard players set #4096 hook.X0 0
scoreboard players set #8192 hook.X0 0
scoreboard players set #16384 hook.X0 0
scoreboard players set #32768 hook.X0 0
scoreboard players set #65536 hook.X0 0

execute if score #motion hook.temporary matches ..-1 run scoreboard players set #-1 hook.X0 1
execute if score #motion hook.temporary matches ..-1 run scoreboard players operation #motion hook.temporary *= #-1 hook.constant

execute if score #motion hook.temporary matches 65536.. run scoreboard players set #65536 hook.X0 1
execute if score #motion hook.temporary matches 65536.. run scoreboard players operation #motion hook.temporary -= #65536 hook.constant

execute if score #motion hook.temporary matches 32768.. run scoreboard players set #32768 hook.X0 1
execute if score #motion hook.temporary matches 32768.. run scoreboard players operation #motion hook.temporary -= #32768 hook.constant

execute if score #motion hook.temporary matches 16384.. run scoreboard players set #16384 hook.X0 1
execute if score #motion hook.temporary matches 16384.. run scoreboard players operation #motion hook.temporary -= #16384 hook.constant

execute if score #motion hook.temporary matches 8192.. run scoreboard players set #8192 hook.X0 1
execute if score #motion hook.temporary matches 8192.. run scoreboard players operation #motion hook.temporary -= #8192 hook.constant

execute if score #motion hook.temporary matches 4096.. run scoreboard players set #4096 hook.X0 1
execute if score #motion hook.temporary matches 4096.. run scoreboard players operation #motion hook.temporary -= #4096 hook.constant

execute if score #motion hook.temporary matches 2048.. run scoreboard players set #2048 hook.X0 1
execute if score #motion hook.temporary matches 2048.. run scoreboard players operation #motion hook.temporary -= #2048 hook.constant

execute if score #motion hook.temporary matches 1024.. run scoreboard players set #1024 hook.X0 1
execute if score #motion hook.temporary matches 1024.. run scoreboard players operation #motion hook.temporary -= #1024 hook.constant

execute if score #motion hook.temporary matches 512.. run scoreboard players set #512 hook.X0 1
execute if score #motion hook.temporary matches 512.. run scoreboard players operation #motion hook.temporary -= #512 hook.constant

execute if score #motion hook.temporary matches 256.. run scoreboard players set #256 hook.X0 1
execute if score #motion hook.temporary matches 256.. run scoreboard players operation #motion hook.temporary -= #256 hook.constant

execute if score #motion hook.temporary matches 128.. run scoreboard players set #128 hook.X0 1
execute if score #motion hook.temporary matches 128.. run scoreboard players operation #motion hook.temporary -= #128 hook.constant

execute if score #motion hook.temporary matches 64.. run scoreboard players set #64 hook.X0 1
execute if score #motion hook.temporary matches 64.. run scoreboard players operation #motion hook.temporary -= #64 hook.constant

execute if score #motion hook.temporary matches 32.. run scoreboard players set #32 hook.X0 1
execute if score #motion hook.temporary matches 32.. run scoreboard players operation #motion hook.temporary -= #32 hook.constant

execute if score #motion hook.temporary matches 16.. run scoreboard players set #16 hook.X0 1
execute if score #motion hook.temporary matches 16.. run scoreboard players operation #motion hook.temporary -= #16 hook.constant

execute if score #motion hook.temporary matches 8.. run scoreboard players set #8 hook.X0 1
execute if score #motion hook.temporary matches 8.. run scoreboard players operation #motion hook.temporary -= #8 hook.constant

execute if score #motion hook.temporary matches 4.. run scoreboard players set #4 hook.X0 1
execute if score #motion hook.temporary matches 4.. run scoreboard players operation #motion hook.temporary -= #4 hook.constant

execute if score #motion hook.temporary matches 2.. run scoreboard players set #2 hook.X0 1
execute if score #motion hook.temporary matches 2.. run scoreboard players operation #motion hook.temporary -= #2 hook.constant

execute if score #motion hook.temporary matches 1.. run scoreboard players set #1 hook.X0 1
execute if score #motion hook.temporary matches 1.. run scoreboard players operation #motion hook.temporary -= #1 hook.constant

