#> hook:dev/crane_go
# 試験用(schedule から毎 tick)。ステージ2 のクレーンの中心が z 3〜5 に来たら dev.q を連続で撃つ(dev/seq_s)。#trap hook.dev tick まで待つ
scoreboard players remove #trap hook.dev 1
execute if score #trap hook.dev matches ..0 run return run tellraw @a "crane timeout"
execute in hook:world if entity @e[type=marker,tag=hook.s2crane,x=740,y=90,z=3,dx=40,dy=30,dz=2] run return run function hook:dev/seq_s
schedule function hook:dev/crane_go 1t
