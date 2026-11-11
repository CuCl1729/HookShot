#> hook:stage/1/room/2
# @s = プレイヤー。R2 トゲの回廊: スケルトン2体はトゲに近づかない。トゲの手前から引きずり落とす
function hook:cp/set {id:11,x:242.5,y:64,z:7.5,yaw:-90}
kill @e[tag=hook.s1r2]
execute in hook:world positioned 267.5 68 7.5 run function hook:enemy/summon/skeleton
execute in hook:world positioned 265.5 64 11.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s1r2
tag @e[tag=hook.new] add hook.s1
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"射手がいる。トゲの手前に立って引け。奴らはトゲの上に落ちる。",color:"white"}]
