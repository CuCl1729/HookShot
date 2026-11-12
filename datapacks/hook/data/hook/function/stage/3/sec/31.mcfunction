#> hook:stage/3/sec/31
# @s = 浮島 I1 に着いたプレイヤー。チェックポイントと、この区画の敵
function hook:cp/set {id:31,x:1019.5,y:64,z:0.5,yaw:-90}
execute in hook:world positioned 1048.5 66 6.5 run function hook:enemy/summon/bomber
execute in hook:world positioned 1061.5 70 0.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"島から島へ飛べ。光る柱を狙えば島の上に降りられる。敵は端に立って谷越しに引け。",color:"white"}]
