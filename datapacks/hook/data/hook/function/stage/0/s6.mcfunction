#> hook:stage/0/s6
# @s = 2体を倒したプレイヤー。扉2を開け、次は爆弾兵
scoreboard players set @s hook.tut 6
scoreboard players set #t hook.tut 0
execute in hook:world run fill 50 64 16 50 68 20 minecraft:air
function hook:cp/set {id:5,x:48.5,y:64,z:18.5,yaw:90}
execute in hook:world run tp @e[tag=hook.npc] 47.5 64 26.5
function hook:stage/0/sp6b
function hook:stage/0/sp6z
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 1 1
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"▶ ",color:"aqua"},{text:"爆弾兵: 投げると当たった所で爆ぜ、周りの敵をまとめて倒す。爆風でお前は傷つかない。",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"近寄ると自分で爆ぜる。離れて掴み、固まったゾンビ3体へ投げ込め。",color:"gray"}]
