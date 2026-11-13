#> hook:stage/2/c/next
# hook:world で実行。波を片付けた: 次の波へ(3 の次は炉心の露出)
scoreboard players add #cw hook.s2 1
scoreboard players set #cb hook.s2 0
execute as @a[scores={hook.stage=2}] at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2
execute as @a[scores={hook.stage=2}] at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.6 1 0.6 0.4 40 force @s
particle minecraft:end_rod 676 70 27 8 3 6 0.05 60 force @a
execute if score #cw hook.s2 matches 4.. run return run function hook:stage/2/c/clear
scoreboard players set #ct hook.s2 60
title @a[scores={hook.stage=2}] times 5 30 10
title @a[scores={hook.stage=2}] title {text:"波を凌いだ",color:"yellow"}
execute if score #cw hook.s2 matches 2 run title @a[scores={hook.stage=2}] subtitle {text:"次は 第2波",color:"gold"}
execute if score #cw hook.s2 matches 3 run title @a[scores={hook.stage=2}] subtitle {text:"次は 第3波 これで最後",color:"gold"}
