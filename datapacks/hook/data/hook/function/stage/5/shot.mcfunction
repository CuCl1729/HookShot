#> hook:stage/5/shot
# @s = 欠片の標的のスイッチ(hook:hook/switch から。最後の一手)。欠片が手元へ飛んで三つ揃い、エンディング本編(#end 61〜)が進む
execute if score #shot hook.b3 matches 1 run return 0
scoreboard players set #shot hook.b3 1
kill @s
execute in hook:world run fill 1555 96 -1 1557 99 1 minecraft:air
# 欠片が飛んでくる軌跡
execute as @a[scores={hook.stage=5}] at @s facing 1556.5 97.5 0.5 run particle minecraft:end_rod ^ ^1.5 ^2 0.2 0.2 0.2 0.15 60 force @a
execute in hook:world run particle minecraft:end_rod 1556.5 97.5 0.5 1 1 1 0.3 100 force @a
title @a[scores={hook.stage=5}] times 5 50 20
title @a[scores={hook.stage=5}] title {text:"太陽石の欠片 3/3",color:"gold",bold:true}
title @a[scores={hook.stage=5}] subtitle {text:"三つ、揃った",color:"yellow"}
playsound minecraft:block.beacon.power_select master @a ~ ~ ~ 4 1.2
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 4 1
