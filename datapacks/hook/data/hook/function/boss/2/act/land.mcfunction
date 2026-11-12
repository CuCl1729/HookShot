#> hook:boss/2/act/land
# @s = 着地した番人(実行位置も)。衝撃 → 5 秒動けない
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
particle minecraft:explosion ~ ~0.5 ~ 2 0.2 2 0 12 force @a
particle minecraft:sweep_attack ~ ~0.3 ~ 2.5 0.1 2.5 0 20 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.6
execute positioned ~-3.5 ~ ~-3.5 run function hook:core/call {f:"hook:boss/2/hurt_area"}
function hook:boss/2/daze
