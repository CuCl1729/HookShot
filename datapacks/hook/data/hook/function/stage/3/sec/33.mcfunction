#> hook:stage/3/sec/33
# @s = 足場 I5 に着いたプレイヤー。チェックポイントと、この区画の敵
function hook:cp/set {id:33,x:1093.5,y:74,z:0.5,yaw:-90}
execute in hook:world positioned 1112.5 74 -0.5 run function hook:enemy/summon/heavy
execute in hook:world positioned 1120.5 74 -0.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s3
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"細い回廊に重装兵が二体。正面から当たっても回廊を転がるだけだ。脇の足場へ回り、横から突き落とせ。",color:"white"}]
