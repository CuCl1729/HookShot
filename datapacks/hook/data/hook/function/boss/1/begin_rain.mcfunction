#> hook:boss/1/begin_rain
# 水晶落としの予告を始める。プレイヤーの足元・前・横(第2段階は後ろと逆の横も)に輪
kill @e[type=marker,tag=hook.b1rain]
scoreboard players set #st hook.b1 4
scoreboard players set #t hook.b1 30
execute if score #ph hook.b1 matches 2 run scoreboard players set #t hook.b1 24
function hook:boss/1/tele
execute as @p[scores={hook.stage=1}] at @s rotated ~ 0 run function hook:boss/1/rain_mark
playsound minecraft:block.amethyst_block.resonate hostile @a ~ ~ ~ 2 0.5
title @a[scores={hook.stage=1}] actionbar {text:"天井から水晶が降る! 光る輪から離れろ",color:"light_purple"}
