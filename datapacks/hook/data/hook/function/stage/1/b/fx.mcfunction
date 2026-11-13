#> hook:stage/1/b/fx
# @macro n/sub: 波の始まりの演出(title・音・広間の中央に粒子)。in hook:world でなくてもよい
title @a[scores={hook.stage=1}] times 5 30 10
$title @a[scores={hook.stage=1}] title {text:"$(n)",color:"light_purple",bold:true}
$title @a[scores={hook.stage=1}] subtitle {text:"$(sub)",color:"gray"}
execute in hook:world run particle minecraft:reverse_portal 230.5 75 45.5 8 3 8 0.05 200 force @a
execute in hook:world run particle minecraft:soul_fire_flame 230.5 71.2 45.5 9 0.1 9 0.02 80 force @a
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:entity.evoker.prepare_summon hostile @s ~ ~ ~ 1 0.8
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:entity.ravager.roar hostile @s ~ ~ ~ 0.6 1.2
