#> hook:stage/3/ta/tick
# in hook:world、#ta 1.. の間。残り時間を actionbar に出し、0 で環が消える
scoreboard players remove #ta hook.s3 1
scoreboard players operation #tas hook.s3 = #ta hook.s3
scoreboard players add #tas hook.s3 19
scoreboard players operation #tas hook.s3 /= #20 hook.constant
title @a[scores={hook.stage=3}] actionbar [{text:"疾風の環 残り ",color:"aqua"},{score:{name:"#tas",objective:"hook.s3"},color:"white"},{text:" 秒",color:"aqua"}]
execute if score #ta hook.s3 matches 0 run function hook:stage/3/ta/fail
