#> hook:boss/1/hit
# @s = トゲを踏んだ水晶の巨兵(実行位置も @s)。無敵時間中は無視。踏んだトゲの帯は砕ける(帯は 8 マス以上離れている)
execute if score #b1.inv hook.temporary matches 1.. run return 0
scoreboard players remove #b1.hp hook.temporary 1
scoreboard players set #b1.inv hook.temporary 40
fill ~-2 ~-1 1 ~2 ~1 14 minecraft:air replace minecraft:amethyst_cluster
particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0 3 force @a
playsound minecraft:block.amethyst_block.break hostile @a ~ ~ ~ 2 0.6
playsound minecraft:entity.iron_golem.damage hostile @a ~ ~ ~ 2 0.6
function hook:core/call {f:"hook:boss/1/bar_value"}
execute if score #b1.hp hook.temporary matches ..0 run return run function hook:boss/1/defeat
title @a[scores={hook.stage=1}] actionbar {text:"巨兵がトゲを砕いた! 残りのトゲへ誘い込め",color:"light_purple"}
