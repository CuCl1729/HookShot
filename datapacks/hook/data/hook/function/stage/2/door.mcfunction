#> hook:stage/2/door
# hook:world で実行。3基とも止まった: 中央の扉を開ける
scoreboard players set #door hook.s2 1
fill 789 64 -3 789 71 3 minecraft:air
playsound minecraft:block.iron_door.open block @a 789 66 0 3 0.5
playsound minecraft:block.piston.contract block @a 789 66 0 3 0.5
particle minecraft:explosion 788 67 0 1 2 2 0 10 force @a
title @a[scores={hook.stage=2}] times 10 50 15
title @a[scores={hook.stage=2}] title {text:"扉が開いた",color:"gold"}
title @a[scores={hook.stage=2}] subtitle {text:"東の壁の中央へ",color:"gray"}
