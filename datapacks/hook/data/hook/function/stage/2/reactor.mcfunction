#> hook:stage/2/reactor
# hook:world で実行。炉を1基止めた後の共通の演出と残り数の表示(各炉の off から)
playsound minecraft:block.beacon.deactivate block @a[scores={hook.stage=2}] ~ ~ ~ 2 0.7
playsound minecraft:block.iron_door.close block @a[scores={hook.stage=2}] 789 66 0 3 0.5
scoreboard players operation #n hook.s2 = #ra hook.s2
scoreboard players operation #n hook.s2 += #rb hook.s2
scoreboard players operation #n hook.s2 += #rc hook.s2
tellraw @a[scores={hook.stage=2}] [{text:"動力炉が止まった ",color:"gold"},{score:{name:"#n",objective:"hook.s2"},color:"yellow"},{text:"/3",color:"gray"}]
