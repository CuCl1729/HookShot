#> hook:boss/2/tick
# 毎 tick(hook:stage/2/tick から)。#state hook.b2: 0 待機 / 1 戦闘中 / 2 撃破済み(演出→ステージ3)
# ボス部屋 = x 820〜862, z ±13, y 60〜84(ガラスの天井 y 85 の上は含めない)。入ると開始、戦闘中に誰もいなくなったら(死亡・落下で前室へ戻った)やり直し
execute in hook:world if score #state hook.b2 matches 0 if entity @a[scores={hook.stage=2},x=820,y=60,z=-13,dx=42,dy=24,dz=26] run function hook:boss/2/start
execute in hook:world if score #state hook.b2 matches 1 unless entity @a[scores={hook.stage=2},x=820,y=60,z=-13,dx=42,dy=24,dz=26] run return run function hook:boss/2/reset
execute if score #state hook.b2 matches 1 unless entity @e[tag=hook.boss2] in hook:world run return run function hook:boss/2/reset
execute if score #state hook.b2 matches 2 run return run function hook:boss/2/post
execute unless score #state hook.b2 matches 1 run return 0
execute if score #inv hook.b2 matches 1.. run scoreboard players remove #inv hook.b2 1
execute as @e[tag=hook.boss2,limit=1] at @s run function hook:boss/2/ai
