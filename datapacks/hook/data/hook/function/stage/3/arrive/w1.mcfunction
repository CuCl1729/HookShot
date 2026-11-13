#> hook:stage/3/arrive/w1
# @s = 塔へ向かう見張り岩 W1 に着いたプレイヤー
scoreboard players set #w1 hook.s3 1
execute in hook:world positioned 1189.5 59 -27.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
function hook:guide/set {text:"動く錨で塔の麓へ",x:1186.5,y:59,z:-25.5}
tellraw @s {text:"金の錨は上下に揺れている。届く高さに来た時に撃つ。掴んだ錨と、そばに人のいる錨は止まる。",color:"gray"}
tellraw @s {text:"向こう岸に射手がいる。着いたら掴んで奈落へ。",color:"gray"}
