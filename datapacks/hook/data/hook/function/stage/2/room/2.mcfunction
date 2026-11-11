#> hook:stage/2/room/2
# @s = プレイヤー。プレスの練習: プレスの下に足止めしたゾンビ1、奥にゾンビ2。全滅で門 x 691 が開く
function hook:cp/set {id:21,x:648.5,y:64,z:0.5,yaw:-90}
execute in hook:world positioned 668.5 64 0.5 run function hook:enemy/summon/zombie
effect give @e[tag=hook.new] minecraft:slowness infinite 255 true
execute in hook:world positioned 684.5 64 -4.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 684.5 64 4.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s2
tag @e[tag=hook.new] add hook.s2r2
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[声] ",color:"aqua"},{text:"これがプレス機。四隅にぶら下がった標的を撃てば落ちる。下にいる敵は潰れるが、人には当たらないよう作ってある。",color:"white"}]
tellraw @s [{text:"[声] ",color:"aqua"},{text:"まず下のゾンビを潰せ。残りはプレスの下へ引き寄せてから落とすといい。",color:"white"}]
