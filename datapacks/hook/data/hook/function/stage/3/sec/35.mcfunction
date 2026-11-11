#> hook:stage/3/sec/35
# @s = 島 E に着いたプレイヤー。チェックポイントと、この区画の敵
function hook:cp/set {id:35,x:1151.5,y:80,z:0.5,yaw:-90}
execute in hook:world positioned 1181.5 98 -3.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"塔を登れ。頂で射手が狙っている。引きずり下ろせ。",color:"white"}]
