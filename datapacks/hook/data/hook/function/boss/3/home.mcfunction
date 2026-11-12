#> hook:boss/3/home
# @s = 王(hook:world)。玉座の島の中央 C へ退かせ、怯みと行動を解く
tp @s 1550.5 64 0.5 -90 0
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
scoreboard players set #stag hook.b3 0
effect clear @s minecraft:glowing
tag @s remove hook.stun
scoreboard players set @s hook.stun 0
scoreboard players set #grd hook.b3 150
function hook:boss/3/rest
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.6 1 0.6 0.5 60 force @a
execute at @s run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 2 0.5
