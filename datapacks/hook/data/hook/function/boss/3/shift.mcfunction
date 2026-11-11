#> hook:boss/3/shift
# @s = HP が半分になった王。第2形態への移行演出を始める(進めるのは hook:boss/3/shift_tick)
scoreboard players set #state hook.b3 2
scoreboard players set #t hook.b3 0
tp @s 1550.5 64 0.5
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
effect give @s minecraft:slowness 4 255 true
effect give @s minecraft:glowing 4 0 true
playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 3 0.5
title @a[scores={hook.stage=4}] title {text:"虚の王",color:"red"}
title @a[scores={hook.stage=4}] subtitle {text:"「ならば玉座の間ごと、虚へ沈め」",color:"gray"}
tellraw @a[scores={hook.stage=4}] [{text:"[虚の王] ",color:"dark_purple"},{text:"小賢しい鉤よ。足場がなければ、何も掴めまい。",color:"gray",italic:true}]
