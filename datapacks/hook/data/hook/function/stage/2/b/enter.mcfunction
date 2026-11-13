#> hook:stage/2/b/enter
# @s = プレイヤー。高所の柱の下に来た: 案内と、炉の台 B3 の見張り(重装兵。歩かせない。倒すのは任意)
scoreboard players set #be hook.s2 1
execute in hook:world positioned 762.5 111 -31.5 run function hook:enemy/summon/heavy
# 台から歩いて落ちないよう移動速度 0(鈍足では止まらない)。フックの突き飛ばしは Motion なので効く
attribute @e[tag=hook.new,limit=1] minecraft:movement_speed base set 0
tag @e[tag=hook.new] add hook.s2b
tag @e[tag=hook.new] add hook.s2
function hook:fairy/say {text:"炉は天井近く！ 吊り台は運んでくれないから、中ほどに来たら飛び移ってすぐ次だよ"}
tellraw @s {text:"東の炉は天井近くの台の上。柱と浮き台を伝って登り、最後は往復するクレーンの吊り台を中継する。外の壁は登れない。",color:"gray"}
execute unless score #rb hook.s2 matches 1 run function hook:guide/set {text:"クレーンを渡り炉の標的を撃つ",x:760.5,y:112,z:-31.5}
