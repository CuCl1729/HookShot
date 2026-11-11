scoreboard players remove @s hook.stun 1
particle minecraft:electric_spark ~ ~2 ~ 0.3 0.1 0.3 0 1 force @a
execute if score @s hook.stun matches ..0 run tag @s remove hook.stun
