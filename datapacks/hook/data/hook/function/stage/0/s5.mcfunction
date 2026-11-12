#> hook:stage/0/s5
# @s = 的に投げ当てたプレイヤー。扉1を開け、次は敵を敵へ投げる
scoreboard players set @s hook.tut 5
scoreboard players set #t hook.tut 0
execute in hook:world run fill 70 64 38 70 68 42 minecraft:air
function hook:cp/set {id:4,x:66.5,y:64,z:40.5,yaw:90}
execute in hook:world run tp @e[tag=hook.npc] 65.5 64 35.5
kill @e[tag=hook.tut4]
function hook:stage/0/sp5a
function hook:stage/0/sp5b
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 1 1
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"▶ ",color:"aqua"},{text:"投げた敵は壁に当たっても倒れる。",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"敵を敵へ: 片方を掴んで、もう片方に投げつけろ。まとめて倒れる。",color:"gray"}]
