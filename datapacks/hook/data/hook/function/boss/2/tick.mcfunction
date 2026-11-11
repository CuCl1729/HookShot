#> hook:boss/2/tick
# 毎 tick(hook:stage/2/tick から)。#state hook.b2: 0 待機 / 1 戦闘中 / 2 撃破済み
# ボス部屋 = x 820〜862, z ±13, y 72〜97。入ると開始、戦闘中に誰もいなくなったら(死亡・落下で前室へ戻った)やり直し
execute in hook:world if score #state hook.b2 matches 0 if entity @a[scores={hook.stage=2},x=820,y=72,z=-13,dx=42,dy=25,dz=26] run function hook:boss/2/start
execute in hook:world if score #state hook.b2 matches 1 unless entity @a[scores={hook.stage=2},x=820,y=72,z=-13,dx=42,dy=25,dz=26] run return run function hook:boss/2/reset
execute if score #state hook.b2 matches 1 unless entity @e[tag=hook.boss2] in hook:world run return run function hook:boss/2/reset
execute if score #inv hook.b2 matches 1.. run scoreboard players remove #inv hook.b2 1
# ヘビーインパクトで突き飛ばされたらよろける(その間に標的を撃てる)
execute as @e[tag=hook.boss2,tag=hook.impacted] at @s run function hook:boss/2/stagger
