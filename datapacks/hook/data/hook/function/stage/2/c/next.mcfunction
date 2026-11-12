#> hook:stage/2/c/next
# hook:world で実行。波を片付けた: 次の波へ(3 の次は炉心の露出)
scoreboard players add #cw hook.s2 1
execute if score #cw hook.s2 matches 4.. run return run function hook:stage/2/c/clear
scoreboard players set #ct hook.s2 60
title @a[scores={hook.stage=2}] times 5 30 10
title @a[scores={hook.stage=2}] title {text:""}
execute if score #cw hook.s2 matches 2 run title @a[scores={hook.stage=2}] subtitle {text:"第2波",color:"gold"}
execute if score #cw hook.s2 matches 3 run title @a[scores={hook.stage=2}] subtitle {text:"第3波",color:"gold"}
