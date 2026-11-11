#> hook:stage/1/room/5
# @s = プレイヤー。R5 重装兵の架け橋: 谷の足場に立つ重装兵(動かない)へ飛び移って渡る
function hook:cp/set {id:14,x:362.5,y:64,z:7.5,yaw:-90}
kill @e[tag=hook.s1r5]
execute in hook:world positioned 377.5 64 7.5 run function hook:enemy/summon/heavy
execute in hook:world positioned 391.5 64 7.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s1r5
tag @e[tag=hook.new] add hook.s1
execute as @e[tag=hook.new] run data modify entity @s NoAI set value 1b
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"橋が落ちた。眠った重装兵が足場に立っている。重い奴にフックを当てれば、お前の方が飛んでいく。",color:"white"}]
