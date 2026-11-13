#> hook:fx/ability_get
# @macro name/sub: 能力獲得(全員)。例 {name:"ヘビーインパクト",sub:"重い敵へ飛ぶと突き飛ばす"}。hook.ability は呼ぶ側が上げる
title @a times 10 80 20
$title @a subtitle {text:"$(sub)",color:"white"}
$title @a title [{text:"鉤が輝く ",color:"aqua"},{text:"$(name)",color:"aqua",bold:true}]
$tellraw @a [{text:"能力獲得: ",color:"aqua"},{text:"$(name)",color:"white",bold:true},{text:"  $(sub)",color:"gray"}]
execute as @a at @s run playsound minecraft:block.enchantment_table.use master @s ~ ~ ~ 1 0.8
execute as @a at @s run playsound minecraft:item.trident.thunder master @s ~ ~ ~ 0.5 1.6
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1
execute as @a at @s run particle minecraft:enchant ~ ~1.5 ~ 1 1 1 1 150 force @s
execute as @a at @s run particle minecraft:electric_spark ~ ~1 ~ 0.6 1 0.6 0.4 60 force @s
execute as @a at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.5 80 force @s
