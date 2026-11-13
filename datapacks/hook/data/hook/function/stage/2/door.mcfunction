#> hook:stage/2/door
# hook:world で実行。3基とも止まった: 中央の扉を開ける
scoreboard players set #door hook.s2 1
fill 789 64 -3 789 71 3 minecraft:air
playsound minecraft:block.iron_door.open block @a 789 66 0 3 0.5
playsound minecraft:block.piston.contract block @a 789 66 0 3 0.5
playsound minecraft:entity.generic.explode block @a 789 66 0 3 0.5
execute as @a[scores={hook.stage=2}] at @s run playsound minecraft:block.bell.use master @s ~ ~ ~ 1 0.6
execute as @a[scores={hook.stage=2}] at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 0.8
particle minecraft:explosion_emitter 788 67 0 0 0 0 0 1 force @a
particle minecraft:explosion 788 67 0 1 2 2 0 15 force @a
particle minecraft:large_smoke 787 67 0 1 3 3 0.05 120 force @a
particle minecraft:end_rod 787 67 0 0.5 3 3 0.05 60 force @a
title @a[scores={hook.stage=2}] times 10 50 15
title @a[scores={hook.stage=2}] title {text:"扉が開いた",color:"gold",bold:true}
title @a[scores={hook.stage=2}] subtitle {text:"東の壁の中央へ",color:"gray"}
function hook:fairy/say {text:"扉が開いた！ 欠片の気配、すぐそこだよ"}
function hook:guide/set {text:"開いた扉から奥へ進む",x:805.5,y:64,z:0.5}
