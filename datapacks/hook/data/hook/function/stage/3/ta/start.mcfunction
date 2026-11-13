#> hook:stage/3/ta/start
# @s = 号砲の標的のスイッチ(重複しても1回だけ効く)。疾風の環を 25 秒(500 tick)出す(標的→環4つ→島で6手、人の狙い直しを1手約4秒と見込む)
execute if score #n hook.s3 matches 1 run return 0
execute if score #ta hook.s3 matches 1.. run return 0
scoreboard players set #ta hook.s3 500
execute in hook:world run function hook:stage/3/ta/rings
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 2 1.6
execute in hook:world run particle minecraft:end_rod 1074 77 -22 1.5 1.5 0.5 0.02 40 force @a
title @a[scores={hook.stage=3}] actionbar {text:"疾風の環! 着地せず北西の島まで",color:"aqua"}
