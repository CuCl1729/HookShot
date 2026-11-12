#> hook:stage/2/c/tick
# hook:world で毎 tick。#cw: 0 待機 / 1〜3 ウェーブ中 / 4 全滅(炉心が露出)。#ct: 次の波が出るまでの tick
# 戦闘中に誰もアリーナにいなくなったら(死亡・壁を越えて出た)仕切り直し
execute if score #cw hook.s2 matches 1..3 unless entity @a[scores={hook.stage=2},x=641,y=60,z=15,dx=70,dy=35,dz=24] run return run function hook:stage/2/c/reset
execute unless score #cw hook.s2 matches 1..3 run return 0
execute if score #ct hook.s2 matches 1.. run scoreboard players remove #ct hook.s2 1
execute if score #ct hook.s2 matches 1 run function hook:stage/2/c/spawn
execute if score #ct hook.s2 matches 0 unless entity @e[tag=hook.s2c] run function hook:stage/2/c/next
