#> hook:stage/2/room/4
# @s = プレイヤー。鍛造ライン: プレス3基と、まばらな敵(ゾンビ2・スケルトン・重装兵)
function hook:cp/set {id:23,x:737.5,y:64,z:0.5,yaw:-90}
execute in hook:world positioned 750.5 64 3.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 761.5 64 -3.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 763.5 64 0.5 run function hook:enemy/summon/heavy
execute in hook:world positioned 772.5 64 0.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s2
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[声] ",color:"aqua"},{text:"鍛造ライン。敵が多い。軽い者は引き寄せ、重い者は突き飛ばして、プレスの下へ。",color:"white"}]
