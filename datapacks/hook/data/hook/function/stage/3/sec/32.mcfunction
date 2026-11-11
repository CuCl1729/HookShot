#> hook:stage/3/sec/32
# @s = 島 B に着いたプレイヤー。チェックポイントと、この区画の敵
function hook:cp/set {id:32,x:1071.5,y:72,z:0.5,yaw:-90}
execute in hook:world positioned 1085.5 72 0.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s3.g
tag @e[tag=hook.new] add hook.s3
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"向こうの細い足場に重装兵がいる。重い敵は引けんが、フックを当てれば痺れて動けん。その隙に体当たりで奈落へ突き飛ばせ。",color:"white"}]
