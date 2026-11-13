#> hook:fairy/tick
# @s = tag hook.lumi のプレイヤー(実行位置も @s。core の tick から)。ルミを左肩の上へ連れて歩く(teleport_duration 3 で遅れてなめらかに付いてくる)
# 遠くに取り残されたルミ(テレポートの前の場所。読み込まれ直したときに見える)は消して出し直す
kill @e[type=item_display,tag=hook.fairy,distance=24..]
execute unless entity @e[type=item_display,tag=hook.fairy,distance=..24] run function hook:fairy/spawn
# ふわふわ: #tick(0〜99)の前半と後半で高さを変える
execute if score #tick hook.temporary matches ..49 rotated ~ 0 positioned ^0.7 ^1.85 ^-0.2 run tp @e[type=item_display,tag=hook.fairy,distance=..26] ~ ~ ~
execute if score #tick hook.temporary matches 50.. rotated ~ 0 positioned ^0.7 ^2.15 ^-0.2 run tp @e[type=item_display,tag=hook.fairy,distance=..26] ~ ~ ~
# 光の粉(欠片が多いほど多い)
scoreboard players operation #m hook.temporary = #tick hook.temporary
scoreboard players operation #m hook.temporary %= #4 hook.constant
execute if score #m hook.temporary matches 0 as @e[type=item_display,tag=hook.fairy,distance=..26] at @s run function hook:fairy/dust
execute if score #tick hook.temporary matches 0 as @e[type=item_display,tag=hook.fairy,distance=..26] run function hook:fairy/look
