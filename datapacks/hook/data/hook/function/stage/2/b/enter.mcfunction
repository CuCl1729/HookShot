#> hook:stage/2/b/enter
# @s = プレイヤー。高所の柱の下に来た: 案内と、炉の台 B3 の見張り(重装兵。歩かせない)
scoreboard players set #be hook.s2 1
execute in hook:world positioned 762.5 111 -31.5 run function hook:enemy/summon/heavy
# 台から歩いて落ちないよう移動速度 0(鈍足では止まらない)。フックの突き飛ばしは Motion なので効く
attribute @e[tag=hook.new,limit=1] minecraft:movement_speed base set 0
tag @e[tag=hook.new] add hook.s2b
tag @e[tag=hook.new] add hook.s2
tellraw @s {text:"東の炉は天井近くの台の上。柱と浮き台を伝って登り、最後は往復するクレーンの吊り台を中継する。",color:"gray"}
tellraw @s {text:"吊り台は乗っても運んでくれない。台が中ほどに来たら飛び移り、すぐ次を撃つ。",color:"gray"}
