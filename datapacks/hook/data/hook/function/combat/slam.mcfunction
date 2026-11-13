#> hook:combat/slam
# @s = 壁や敵に高速でぶつかった敵(実行位置はぶつかった所)。死なずに怯む(hook:hook/stun)。ボスは来ない
particle minecraft:crit ~ ~1 ~ 0.4 0.4 0.4 0.3 20 force @a
playsound minecraft:block.anvil.land hostile @a ~ ~ ~ 0.8 1.4
function hook:hook/stun
scoreboard players set @s hook.vh 0
