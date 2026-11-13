#> hook:boss/3/damage
# @s = 虚の王。HP を1減らし無敵時間を付ける。第1形態で半分(3)になったら移行
scoreboard players remove #hp hook.b3 1
scoreboard players set #inv hook.b3 60
function hook:core/call {f:"hook:boss/3/bar_set"}
particle minecraft:explosion ~ ~1 ~ 0.6 0.6 0.6 0 6 force @a
playsound minecraft:entity.wither.hurt hostile @a ~ ~ ~ 2 0.6
particle minecraft:totem_of_undying ~ ~2 ~ 0.8 1 0.8 0.5 60 force @a
particle minecraft:end_rod ~ ~2 ~ 0.3 0.6 0.3 0.4 40 force @a
playsound minecraft:block.amethyst_block.break hostile @a ~ ~ ~ 2 0.6
playsound minecraft:entity.player.attack.crit hostile @a ~ ~ ~ 2 0.7
execute if score #state hook.b3 matches 1 if score #hp hook.b3 matches ..3 run return run function hook:boss/3/shift
title @a[scores={hook.stage=4}] actionbar {text:"効いた!",color:"gold",bold:true}
