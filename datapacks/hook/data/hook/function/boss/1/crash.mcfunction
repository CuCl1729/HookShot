#> hook:boss/1/crash
# 突進が壁・柱に当たった。2 秒よろける(隙)
scoreboard players set #st hook.b1 5
scoreboard players set #t hook.b1 40
particle minecraft:explosion ~ ~1.5 ~ 0.5 0.5 0.5 0 3 force @a
playsound minecraft:entity.zombie.attack_iron_door hostile @a ~ ~ ~ 2 0.5
title @a[scores={hook.stage=1}] actionbar {text:"巨兵が壁に激突した! 今のうちに敵を投げ当てろ",color:"light_purple"}
