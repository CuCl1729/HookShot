#> hook:combat/grab
# @s = 掴む位置に着いた敵。目の前に浮かせて持つ(tag hook.grabbed。次の右クリックで投げる)
tag @s remove hook.yanking
tag @s add hook.grabbed
execute at @n[type=marker,tag=hook.hp] run tp @s ~ ~ ~
kill @e[type=marker,tag=hook.hp]
playsound minecraft:item.armor.equip_chain player @a ~ ~ ~ 1 1.2
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.4 0.3 0 8 force @a
