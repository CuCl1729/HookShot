#> hook:hook/use
# @s = フックショットで右クリックしているプレイヤー(進捗 hook:right_click から。押し続けている間は毎tick)
advancement revoke @s only hook:right_click
execute if score @s hook.cd matches 1.. run return 0
scoreboard players set @s hook.cd 10
function hook:hook/release
execute at @s run playsound minecraft:item.crossbow.shoot player @a ~ ~ ~ 1 1.4
# 射程24 = 0.25 × 96
scoreboard players set #ray hook.temporary 96
execute at @s anchored eyes positioned ^ ^ ^0.5 anchored feet run function hook:hook/ray
tag @e[tag=hook.hit] remove hook.hit
