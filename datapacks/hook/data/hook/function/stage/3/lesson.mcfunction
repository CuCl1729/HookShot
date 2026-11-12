#> hook:stage/3/lesson
# @s = プレイヤー。#lesson 0: 稽古のゾンビをスタンさせる / 1: そのゾンビを片付ける → 環の島 R0 が出る(2)
execute unless score #lesson hook.s3 matches 1.. if entity @e[tag=hook.s3t,tag=hook.stun] run function hook:stage/3/lesson_stun
execute if entity @e[tag=hook.s3t] run return 0
execute if score #lesson hook.s3 matches 1 run return run function hook:stage/3/open1
# スタンさせる前に消えた(勝手に落ちた等)ら出し直す
execute in hook:world positioned 1013.5 64 0.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3t
