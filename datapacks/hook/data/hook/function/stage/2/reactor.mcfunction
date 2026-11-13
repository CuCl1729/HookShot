#> hook:stage/2/reactor
# hook:world で実行。炉を1基止めた後の共通の演出・残り数・次の案内(各炉の off / stop から)
playsound minecraft:block.beacon.deactivate block @a[scores={hook.stage=2}] ~ ~ ~ 3 0.7
playsound minecraft:entity.generic.explode block @a[scores={hook.stage=2}] ~ ~ ~ 2 0.6
playsound minecraft:block.iron_door.close block @a[scores={hook.stage=2}] 789 66 0 3 0.5
execute as @a[scores={hook.stage=2}] at @s run playsound minecraft:block.beacon.deactivate master @s ~ ~ ~ 1 0.6
particle minecraft:large_smoke ~ ~3 ~ 2 3 2 0.05 120 force @a
particle minecraft:lava ~ ~2 ~ 2 2 2 0 40 force @a
particle minecraft:electric_spark ~ ~2 ~ 2 2 2 0.3 80 force @a
particle minecraft:large_smoke 788 74 0 0.3 1 6 0.02 40 force @a
scoreboard players operation #n hook.s2 = #ra hook.s2
scoreboard players operation #n hook.s2 += #rb hook.s2
scoreboard players operation #n hook.s2 += #rc hook.s2
title @a[scores={hook.stage=2}] times 5 40 15
title @a[scores={hook.stage=2}] title {text:"動力炉 停止",color:"gold",bold:true}
title @a[scores={hook.stage=2}] subtitle [{score:{name:"#n",objective:"hook.s2"},color:"yellow"},{text:" / 3",color:"gray"}]
tellraw @a[scores={hook.stage=2}] [{text:"動力炉が止まった ",color:"gold"},{score:{name:"#n",objective:"hook.s2"},color:"yellow"},{text:"/3",color:"gray"}]
execute if score #n hook.s2 matches 1 run function hook:fairy/say {text:"止まった！ あと2基だよ"}
execute if score #n hook.s2 matches 2 run function hook:fairy/say {text:"あと1基！ 扉のランプもあとひとつ"}
function hook:stage/2/goal
