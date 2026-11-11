#> hook:stage/1/room/6
# @s = プレイヤー。R6 水晶の群れ: ゾンビ4体はトゲの堀を越えて来て死ぬ。台の上のスケルトンは堀の手前から引き落とす
function hook:cp/set {id:15,x:412.5,y:64,z:7.5,yaw:-90}
kill @e[tag=hook.s1r6]
execute in hook:world positioned 443.5 64 3.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 441.5 64 7.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 442.5 64 11.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 445.5 64 9.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 439.5 68 3.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s1r6
tag @e[tag=hook.new] add hook.s1
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"群れだ。正面からは無理だ。堀を盾にしろ。",color:"white"}]
