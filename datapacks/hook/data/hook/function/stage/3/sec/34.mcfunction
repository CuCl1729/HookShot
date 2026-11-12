#> hook:stage/3/sec/34
# @s = 島 D に着いたプレイヤー。チェックポイントと、この区画の敵
function hook:cp/set {id:34,x:1133.5,y:76,z:0.5,yaw:-90}
execute in hook:world positioned 1156.5 80 -2.5 run function hook:enemy/summon/bomber
execute in hook:world positioned 1156.5 80 2.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s3
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"向こうの島にクモが二匹。速いが軽い。島の端から引いて谷へ落とせ。",color:"white"}]
