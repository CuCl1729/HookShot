#> hook:boss/3/shift
# @s = HP が半分になった王。第2形態への移行演出を始める(進めるのは hook:boss/3/shift_tick)。
# 復帰地点はここで入口の島 E へ(演出中・崩落後に落ちても戦闘が続く)
scoreboard players set #state hook.b3 2
scoreboard players set #t hook.b3 0
scoreboard players set #stag hook.b3 0
function hook:boss/3/rest
tag @a[scores={hook.stage=4}] add hook.cp_quiet
execute as @a[scores={hook.stage=4}] run function hook:cp/set {id:41,x:1518.5,y:64,z:0.5,yaw:-90}
tag @a remove hook.cp_quiet
tp @s 1550.5 64 0.5 -90 0
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
effect give @s minecraft:glowing 4 0 true
playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 3 0.5
kill @e[tag=hook.b3m]
title @a[scores={hook.stage=4}] times 10 50 15
title @a[scores={hook.stage=4}] title {text:"虚の王",color:"red",bold:true}
title @a[scores={hook.stage=4}] subtitle {text:"真なる虚が目を覚ます",color:"gray"}
tellraw @a[scores={hook.stage=4}] {text:"§5虚の王§d「ならば、その小さな光ごと呑んでやろう」"}
playsound minecraft:entity.warden.roar hostile @a ~ ~ ~ 4 0.6
particle minecraft:sonic_boom ~ ~3 ~ 0 0 0 0 1 force @a
particle minecraft:reverse_portal ~ ~2 ~ 2 2 2 1 200 force @a
