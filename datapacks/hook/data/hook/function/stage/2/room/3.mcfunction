#> hook:stage/2/room/3
# @s = プレイヤー。ベルトの谷: 浮き台の奥の柱を撃って渡る。2つ目の台にクモ
function hook:cp/set {id:22,x:694.5,y:64,z:0.5,yaw:-90}
execute in hook:world positioned 720.5 64 -1.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s2
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[声] ",color:"aqua"},{text:"昔はここをベルトが走っていた。台の奥の柱を撃てば、台の上に降りられる。",color:"white"}]
