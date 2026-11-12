#> hook:stage/3/arrive/w2
# @s = 塔の麓 W2 に着いたプレイヤー
scoreboard players set #w2 hook.s3 1
function hook:stage/3/cp {id:33,x:1183.5,y:59,z:-24.5,yaw:-90}
execute in hook:world positioned 1211.5 73 -35.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
execute in hook:world positioned 1216.5 87 -30.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
execute in hook:world positioned 1216.5 117 -34.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s3
tellraw @s {text:"塔の外周の棚を、ぐるりと回って登る。棚の射手は掴んで奈落へ。",color:"gray"}
tellraw @s {text:"頂の重装兵は掴めない。体ごと飛び込んで、縁の外へ突き落とす。",color:"gray"}
