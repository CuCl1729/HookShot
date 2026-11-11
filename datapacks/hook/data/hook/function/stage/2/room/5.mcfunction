#> hook:stage/2/room/5
# @s = プレイヤー。煙突: 柱を撃って上の前室へ。上にスケルトン
function hook:cp/set {id:24,x:784.5,y:70,z:0.5,yaw:-90}
execute in hook:world positioned 801.5 76 -3.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s2
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[声] ",color:"aqua"},{text:"上だ。煙突の柱を撃って登れ。番人の間はその先にある。",color:"white"}]
