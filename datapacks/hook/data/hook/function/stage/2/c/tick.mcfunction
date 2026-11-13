#> hook:stage/2/c/tick
# hook:world で毎 tick。#cw: 0 待機 / 1〜3 ウェーブ中 / 4 全滅(炉心が露出)。#ct: 次の波が出るまでの tick
# 戦闘中に誰もアリーナにいなくなったら(死亡・壁を越えて出た)仕切り直し
execute if score #cw hook.s2 matches 1..3 unless entity @a[scores={hook.stage=2},x=641,y=60,z=15,dx=70,dy=35,dz=24] run return run function hook:stage/2/c/reset
execute unless score #cw hook.s2 matches 1..3 run return 0
execute if score #ct hook.s2 matches 1.. run scoreboard players remove #ct hook.s2 1
execute if score #ct hook.s2 matches 1 run function hook:stage/2/c/spawn
# 投げ・突き飛ばしで壁(高さ 16)を越えた敵は倒れないので、搬入口へ戻す(残ると波が終わらない)
execute as @e[tag=hook.s2c,tag=!hook.thrown,tag=!hook.grabbed,tag=!hook.yanking] unless entity @s[x=641,y=55,z=15,dx=70,dy=45,dz=24] run function hook:stage/2/c/back
# 爆弾兵以外が残っていて爆弾兵がいなければ、10 秒ごとに1体だけ補充(重装兵はプレスか爆発でしか倒れないので、詰まないように)
execute if score #ct hook.s2 matches 0 if entity @e[tag=hook.s2c,tag=!hook.bomb] unless entity @e[tag=hook.s2c,tag=hook.bomb] run scoreboard players add #cb hook.s2 1
execute if score #cb hook.s2 matches 200.. run function hook:stage/2/c/bomber
execute if score #ct hook.s2 matches 0 unless entity @e[tag=hook.s2c] run function hook:stage/2/c/next
