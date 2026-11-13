#> hook:fx/cp
# @s = プレイヤー。チェックポイント到達(cp/set から自動。ステージの最初の cp とナイトメアの巻き戻しでは出ない)
title @s actionbar {text:"✦ チェックポイント ✦",color:"aqua"}
execute at @s run playsound minecraft:block.respawn_anchor.set_spawn master @s ~ ~ ~ 0.8 1.4
execute at @s run playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 1 1.2
execute at @s run particle minecraft:end_rod ~ ~0.2 ~ 0.6 0.05 0.6 0.04 30 force @s
execute at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.8 0.5 0 15 force @s
