#> hook:intro/grant_hook
# @s = プレイヤー。長老から鉤を授かる(ここで初めてフックショットを持つ)
function hook:player/give_hook
tellraw @s [{text:"鉤(フックショット)",color:"gold",bold:true},{text:" を授かった",color:"white"}]
execute at @s run playsound minecraft:block.enchantment_table.use master @s ~ ~ ~ 1 1
execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 0.8 1.4
execute at @s run particle minecraft:enchant ~ ~1.5 ~ 0.6 0.8 0.6 1 120 force @s
execute at @s run particle minecraft:end_rod ~ ~1 ~ 0.5 0.8 0.5 0.05 30 force @s
