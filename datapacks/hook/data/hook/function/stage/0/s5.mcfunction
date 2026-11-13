#> hook:stage/0/s5
# @s = 的に投げ当てたプレイヤー。扉1を開け、次は敵を敵へ投げる(当たった相手は弾かれて怯む。倒れはしない)
scoreboard players set @s hook.tut 5
scoreboard players set #t hook.tut 0
execute in hook:world run fill 70 64 38 70 68 42 minecraft:air
execute in hook:world run particle minecraft:end_rod 70.5 66 40 0.3 1.5 1.5 0.05 50 force @a
function hook:cp/set {id:4,x:66.5,y:64,z:40.5,yaw:90}
execute in hook:world run tp @e[tag=hook.npc] 65.5 64 35.5
kill @e[tag=hook.tut4]
function hook:stage/0/sp5a
function hook:stage/0/sp5b
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 1 1
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"▶ ",color:"aqua"},{text:"投げた敵は、的や壁に当たっても倒れない。怯んで跳ね返るだけ。",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"敵を敵へ: 片方を掴んで、もう片方に投げつけろ。当たった相手も大きく弾かれる。弾いた先にトゲや奈落があれば、そこで倒れる。",color:"gray"}]
function hook:stage/0/goal
