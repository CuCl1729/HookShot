#> hook:hook/pull_sound
# @s = 引かれているプレイヤー。移動中の音(3 tick ごと)
scoreboard players operation #m hook.temporary = @s hook.pull
scoreboard players operation #m hook.temporary %= #3 hook.constant
execute if score #m hook.temporary matches 0 run playsound minecraft:block.chain.step player @a ~ ~ ~ 1 1.6
