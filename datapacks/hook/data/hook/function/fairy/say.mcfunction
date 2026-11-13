#> hook:fairy/say
# @macro text: ルミの台詞(STORY.md の書式 §bルミ§f「…」で全員に出す)。「"」と「\」は使えない
$tellraw @a {text:"§bルミ§f「$(text)」"}
execute as @a at @s run playsound minecraft:entity.allay.ambient_without_item master @s ~ ~ ~ 0.8 1.4
execute as @e[type=item_display,tag=hook.fairy] at @s run particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.03 8
