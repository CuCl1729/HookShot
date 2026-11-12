#> hook:stage/1/arrive/b
# @s = 広間 B に入ったプレイヤー。格子を閉じて第1波(ゾンビ3)
scoreboard players set #bw hook.s1 1
scoreboard players set #bt hook.s1 0
execute in hook:world run fill 226 71 28 234 76 28 minecraft:iron_bars
function hook:cp/set {id:13,x:230.5,y:71,z:31.5,yaw:0}
playsound minecraft:block.iron_door.close master @a ~ ~ ~ 1 0.7
function hook:stage/1/spawn {k:"zombie",x:230.5,y:71,z:58.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"zombie",x:220.5,y:71,z:46.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"zombie",x:240.5,y:71,z:46.5,t:"hook.s1b"}
title @a[scores={hook.stage=1}] times 5 30 10
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle {text:"第1波",color:"light_purple"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"広間: 3つの波を倒すまで格子は開かない。掴んだ敵をトゲの島の上で放せ(スニーク)。",color:"gray"}]
