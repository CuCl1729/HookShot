#> hook:fx/stage_title
# @macro name/sub: ステージ開始のタイトルカード(全員)。stage/<n>/start の title の代わりに呼ぶ。「"」は使えない
title @a times 15 70 25
$title @a subtitle {text:"$(sub)",color:"yellow"}
$title @a title {text:"$(name)",color:"gold",bold:true}
execute as @a at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.7
execute as @a at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 0.8 1.2
execute as @a at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.5 0.6
execute as @a at @s run particle minecraft:end_rod ~ ~1 ~ 1.5 1 1.5 0.05 60 force @s
execute as @a at @s run particle minecraft:totem_of_undying ~ ~1 ~ 1 1 1 0.3 40 force @s
