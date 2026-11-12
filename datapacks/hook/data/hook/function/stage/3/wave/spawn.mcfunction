#> hook:stage/3/wave/spawn
scoreboard players set #ws hook.s3 1
execute if score #wave hook.s3 matches 1 run function hook:stage/3/wave/1
execute if score #wave hook.s3 matches 2 run function hook:stage/3/wave/2
execute if score #wave hook.s3 matches 3 run function hook:stage/3/wave/3
title @a[scores={hook.stage=3}] times 5 30 10
title @a[scores={hook.stage=3}] title {text:""}
title @a[scores={hook.stage=3}] subtitle [{text:"番兵 ",color:"red"},{score:{name:"#wave",objective:"hook.s3"},color:"white"},{text:" / 3",color:"white"}]
