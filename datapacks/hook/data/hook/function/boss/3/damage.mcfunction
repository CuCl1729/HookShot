#> hook:boss/3/damage
# @s = 虚の王。HP を1減らし無敵時間を付ける。第1形態で半分(3)になったら移行
scoreboard players remove #hp hook.b3 1
scoreboard players set #inv hook.b3 60
function hook:core/call {f:"hook:boss/3/bar_set"}
particle minecraft:explosion ~ ~1 ~ 0.6 0.6 0.6 0 6 force @a
playsound minecraft:entity.wither.hurt hostile @a ~ ~ ~ 2 0.6
execute if score #state hook.b3 matches 1 if score #hp hook.b3 matches ..3 run return run function hook:boss/3/shift
title @a[scores={hook.stage=4}] actionbar {text:"効いた!",color:"gold",bold:true}
