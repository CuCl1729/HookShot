#> hook:stage/0/step2
# @s = 訓練台 B に着いたプレイヤー。台の上にゾンビを出す
scoreboard players set @s hook.tut 2
function hook:cp/set {id:1,x:6.5,y:64,z:0.5,yaw:-90}
tag @s remove hook.yanked
execute in hook:world positioned 26.5 68 0.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.tut
# 台から歩いてトゲへ自滅しないよう足止め(フックの Motion では動く)
effect give @e[tag=hook.new] minecraft:slowness infinite 255 true
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範] ",color:"yellow"},{text:"見事。次は敵だ。台の上のゾンビにフックを当てろ。軽い敵はお前の方へ飛んでくる。",color:"white"}]
tellraw @s [{text:"[師範] ",color:"yellow"},{text:"紫のトゲは敵だけを貫く。トゲを挟んだ位置から引きずり落とせ。",color:"white"}]
