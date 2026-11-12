#> hook:boss/1/begin_stomp
# 踏みつけ(第2段階)の予告を始める
scoreboard players set #st hook.b1 6
scoreboard players set #t hook.b1 30
playsound minecraft:entity.warden.sonic_charge hostile @a ~ ~ ~ 2 0.6
title @a[scores={hook.stage=1}] actionbar {text:"巨兵が足を上げた! 柱か壁へ飛んで、床から離れろ",color:"light_purple"}
