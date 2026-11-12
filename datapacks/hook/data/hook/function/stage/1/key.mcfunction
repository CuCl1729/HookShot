#> hook:stage/1/key
# @s = プレイヤーが 2.5 以内に来た水晶鍵(item_display、実行位置も @s)
tag @s remove hook.s1key
scoreboard players add #keys hook.s1 1
particle minecraft:end_rod ~ ~0.3 ~ 0.4 0.4 0.4 0.05 30 force @a
playsound minecraft:block.amethyst_block.resonate master @a ~ ~ ~ 1 1.2
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.6 1.4
title @a[scores={hook.stage=1}] times 5 40 10
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle [{text:"水晶鍵 ",color:"light_purple"},{score:{name:"#keys",objective:"hook.s1"},color:"white"},{text:"/3",color:"white"}]
tellraw @a[scores={hook.stage=1}] [{text:"水晶鍵 ",color:"light_purple"},{score:{name:"#keys",objective:"hook.s1"},color:"white"},{text:"/3",color:"white"}]
kill @s
