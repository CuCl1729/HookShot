#> hook:boss/3/damage
# @s = 虚の王。HP を1減らし無敵時間を付ける
scoreboard players remove #hp hook.b3 1
scoreboard players set #inv hook.b3 60
function hook:core/call {f:"hook:boss/3/bar_set"}
effect give @s minecraft:glowing 3 0 true
particle minecraft:explosion ~ ~1 ~ 0.6 0.6 0.6 0 6 force @a
playsound minecraft:entity.wither.hurt hostile @a ~ ~ ~ 2 0.6
