#> hook:stage/3/chase/reset
# @s = 崩落中に落ちたプレイヤー。雲を戻してやり直せるようにする
scoreboard players set #chase hook.s3 0
execute in hook:world run function hook:stage/3/chase/build
title @s actionbar {text:"雲が元に戻った",color:"gray"}
