#> hook:stage/0/s3
# @s = C の塔の上に着いたプレイヤー。次はフロート
scoreboard players set @s hook.tut 3
scoreboard players set #t hook.tut 0
scoreboard players set #fl hook.tut 0
function hook:cp/set {id:2,x:51.5,y:82,z:0.5,yaw:-90}
execute in hook:world run tp @e[tag=hook.npc] 54.5 82 3.5
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"▶ ",color:"aqua"},{text:"フロート: 空中でスニークを押し続けると、ゆっくり落ちる。",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"次の台は前の幕の下に隠れている。飛び降りて浮き、幕の下に見えた台の縁を撃て。",color:"gray"}]
