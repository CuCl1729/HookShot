#> hook:boss/3/p1_press
# @s = プレスに潰された王(第1形態)。プレスは1回だけ効く
execute if score #pr hook.b3 matches 1.. run return run title @a[scores={hook.stage=4}] actionbar {text:"プレスはもう効かない。紫のトゲへ突き飛ばせ",color:"light_purple"}
scoreboard players set #pr hook.b3 1
function hook:boss/3/damage
execute if score #sp hook.b3 matches 1.. run return run function hook:boss/3/shift
title @a[scores={hook.stage=4}] actionbar {text:"潰した! 次は紫のトゲへ突き飛ばせ",color:"light_purple"}
