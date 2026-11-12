#> hook:boss/1/charge
# 突進(1 tick に 0.8 / 第2段階 1.2)。壁で止まってよろける。トゲを踏むと hook:boss/1/hit。近くのプレイヤーは傷を負う
scoreboard players set #steps hook.b1 4
execute if score #ph hook.b1 matches 2 run scoreboard players set #steps hook.b1 6
function hook:boss/1/charge_step
execute if score #st hook.b1 matches 3 at @s as @a[scores={hook.stage=1},distance=..2.8] run damage @s 6 minecraft:mob_attack by @n[tag=hook.boss1]
execute if score #st hook.b1 matches 3 at @s run particle minecraft:cloud ~ ~0.3 ~ 0.5 0.1 0.5 0.02 4 force @a
execute if score #st hook.b1 matches 3 if score #t hook.b1 matches ..0 run function hook:boss/1/idle
