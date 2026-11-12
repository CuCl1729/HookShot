#> hook:boss/2/daze
# @s = 番人。5 秒(#dz)動けない(突き飛ばされた・壁に激突した・着地した・投げた敵や爆発が当たった)。この間にプレスの標的を撃つ
tag @s remove hook.impacted
function hook:boss/2/set {a:9}
effect give @s minecraft:weakness 5 255 true
particle minecraft:electric_spark ~ ~3 ~ 0.6 0.6 0.6 0 30 force @a
playsound minecraft:block.anvil.place hostile @a ~ ~ ~ 1.5 0.5
