#> hook:stage/3/sec/36
# @s = 塔 T3 に着いたプレイヤー。チェックポイントと、この区画の敵
function hook:cp/set {id:36,x:1181.5,y:98,z:-1.5,yaw:-90}
execute in hook:world positioned 1200.5 98 0.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 1207.5 98 -0.5 run function hook:enemy/summon/heavy
execute in hook:world positioned 1212.5 98 0.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"最後の回廊だ。軽い敵はこの塔から引き落とせ。重装兵は脇の小島から横へ突け。門の向こうに玉座がある。",color:"white"}]
