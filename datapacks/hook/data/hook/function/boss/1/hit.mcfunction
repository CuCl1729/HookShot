#> hook:boss/1/hit
# @s = 巨兵(実行位置も)。トゲを踏んだ・敵を投げ当てられた(hook:boss/hit、charge_step から)。無敵時間中・戦闘外は無視
execute unless score #st hook.b1 matches 1..6 run return 0
execute if score #inv hook.b1 matches 1.. run return 0
scoreboard players remove #hp hook.b1 1
scoreboard players set #inv hook.b1 40
kill @e[type=marker,tag=hook.b1rain]
# 踏んだトゲの島は砕ける(島どうしは 13 マス以上離れている)
fill ~-2 ~-1 ~-2 ~2 ~1 ~2 minecraft:air replace minecraft:amethyst_cluster
particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0 3 force @a
playsound minecraft:block.amethyst_block.break hostile @a ~ ~ ~ 2 0.6
playsound minecraft:entity.iron_golem.damage hostile @a ~ ~ ~ 2 0.6
function hook:core/call {f:"hook:boss/1/bar_value"}
execute if score #hp hook.b1 matches ..0 run return run function hook:boss/1/defeat
execute if score #hp hook.b1 matches ..3 if score #ph hook.b1 matches 1 run function hook:boss/1/phase2
scoreboard players set #st hook.b1 5
scoreboard players set #t hook.b1 50
