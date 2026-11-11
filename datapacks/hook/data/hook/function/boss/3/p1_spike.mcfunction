#> hook:boss/3/p1_spike
# @s = トゲを踏んだ王(第1形態)。トゲは1回だけ効き、踏んだ一角は砕ける(一角は 5x5、互いに遠い)
execute if score #sp hook.b3 matches 1.. run return run title @a[scores={hook.stage=4}] actionbar {text:"トゲはもう効かない。プレスの下へ突き飛ばせ",color:"light_purple"}
scoreboard players set #sp hook.b3 1
function hook:boss/3/damage
fill ~-3 ~ ~-3 ~3 ~ ~3 minecraft:air replace minecraft:amethyst_cluster
playsound minecraft:block.amethyst_block.break hostile @a ~ ~ ~ 2 0.6
execute if score #pr hook.b3 matches 1.. run return run function hook:boss/3/shift
title @a[scores={hook.stage=4}] actionbar {text:"トゲが刺さった! 次はプレスの下へ突き飛ばし、標的を撃て",color:"light_purple"}
