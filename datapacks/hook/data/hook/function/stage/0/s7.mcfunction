#> hook:stage/0/s7
# @s = 3体を倒したプレイヤー。扉3を開け、次は重装兵へ飛ぶ
scoreboard players set @s hook.tut 7
scoreboard players set #t hook.tut 0
execute in hook:world run fill 31 64 27 31 68 31 minecraft:air
execute in hook:world run particle minecraft:end_rod 31.5 66 29 0.3 1.5 1.5 0.05 50 force @a
function hook:cp/set {id:6,x:33.5,y:64,z:29.5,yaw:90}
execute in hook:world run tp @e[tag=hook.npc] 34.5 64 37.5
kill @e[tag=hook.p6b]
function hook:stage/0/sp7
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 1 1
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"▶ ",color:"aqua"},{text:"重い敵: 鉄の重装兵は引き寄せられない。当てると自分の方が飛んでいく。",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"谷の向こうの島に立つ重装兵へ飛び移れ。",color:"gray"}]
function hook:fairy/say {text:"鉄の重装兵は重くて引っぱれないね。こっちが飛んでいこう"}
function hook:stage/0/goal
