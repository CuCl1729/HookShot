#> hook:stage/1/room/4
# @s = プレイヤー。R4 蜘蛛の巣: 暗がりのクモはトゲの堀を越えて飛びかかってくる。堀の手前で待つか引き落とす
function hook:cp/set {id:13,x:322.5,y:64,z:7.5,yaw:-90}
kill @e[tag=hook.s1r4]
execute in hook:world positioned 352.5 64 4.5 run function hook:enemy/summon/bomber
execute in hook:world positioned 354.5 64 10.5 run function hook:enemy/summon/bomber
execute in hook:world positioned 356.5 64 7.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s1r4
tag @e[tag=hook.new] add hook.s1
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"暗がりに蜘蛛が巣くっている。速いが、トゲの堀を挟めば向こうから勝手に死にに来る。",color:"white"}]
