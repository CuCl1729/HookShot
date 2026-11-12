#> hook:boss/3/idle
# hook:world。#cd が尽きたら次の行動を選ぶ。手下が1体もいなければ必ず呼ぶ(投げる弾が尽きて詰まないように)
scoreboard players remove #cd hook.b3 1
execute if score #cd hook.b3 matches 1.. run return 0
scoreboard players set #t hook.b3 0
execute store result score #n hook.b3 if entity @e[tag=hook.b3m]
function hook:core/call {f:"hook:boss/3/roll"}
execute if score #n hook.b3 matches 0 run return run scoreboard players set #act hook.b3 3
# 第1形態: 波 30% / 突撃 45% / 呼ぶ 25%(手下 4 体以上なら突撃)
execute if score #state hook.b3 matches 1 run scoreboard players set #act hook.b3 2
execute if score #state hook.b3 matches 1 if score #r hook.b3 matches ..29 run scoreboard players set #act hook.b3 1
execute if score #state hook.b3 matches 1 if score #r hook.b3 matches 75.. if score #n hook.b3 matches ..3 run scoreboard players set #act hook.b3 3
# 第2形態: 虚渡り 35% / 虚の雨 25% / 二重の波 25% / 呼ぶ 15%(手下 3 体以上なら雨)
execute if score #state hook.b3 matches 3 run scoreboard players set #act hook.b3 4
execute if score #state hook.b3 matches 3 if score #r hook.b3 matches 35.. run scoreboard players set #act hook.b3 5
execute if score #state hook.b3 matches 3 if score #r hook.b3 matches 60..84 run scoreboard players set #act hook.b3 1
execute if score #state hook.b3 matches 3 if score #r hook.b3 matches 85.. if score #n hook.b3 matches ..2 run scoreboard players set #act hook.b3 3
