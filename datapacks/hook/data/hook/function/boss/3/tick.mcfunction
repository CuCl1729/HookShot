#> hook:boss/3/tick
# 毎 tick(hook:stage/4/tick から。実行次元は overworld なので座標は in hook:world で)
# 闘技場 = x 1516〜1584, z ±16(落下中も含めるため y 0〜128)。入ると開始、戦闘中に誰もいなくなったらやり直し
execute if score #state hook.b3 matches 4 run return 0
execute if score #state hook.b3 matches 0 in hook:world if entity @a[scores={hook.stage=4},x=1516,y=0,z=-17,dx=69,dy=128,dz=34] run return run function hook:boss/3/start
execute unless score #state hook.b3 matches 1..3 run return 0
# 死亡(hook.b3d = 死亡数。core が hook.death を先に0にするので別に数える)。第2形態なら第2形態の頭から
execute as @a[scores={hook.b3d=1..}] run function hook:boss/3/died
# やり直しの判定は門の内側の橋(x 1515)も含める
execute in hook:world unless entity @a[scores={hook.stage=4},x=1514,y=0,z=-17,dx=71,dy=128,dz=34] run return run function hook:boss/3/reset
execute unless entity @e[tag=hook.boss3] run return run function hook:boss/3/reset
execute if score #inv hook.b3 matches 1.. run scoreboard players remove #inv hook.b3 1
execute if score #vuln hook.b3 matches 1.. run scoreboard players remove #vuln hook.b3 1
# スタン中は傷が通る。スタン中に突き飛ばされたら 5 秒(奈落へ落ちきるまで)持たせる
execute if entity @e[tag=hook.boss3,tag=hook.stun] if score #vuln hook.b3 matches ..20 run scoreboard players set #vuln hook.b3 20
execute if entity @e[tag=hook.boss3,tag=hook.stun,tag=hook.impacted] run scoreboard players set #vuln hook.b3 100
# 第1形態は突き飛ばされたら番人と同じく3秒よろける(歩いて戻る前に標的を撃てるように)
execute if score #state hook.b3 matches 1 as @e[tag=hook.boss3,tag=hook.impacted] at @s run function hook:boss/2/stagger
tag @e[tag=hook.boss3,tag=hook.impacted] remove hook.impacted
execute if score #state hook.b3 matches 2 run function hook:boss/3/shift_tick
execute if score #state hook.b3 matches 3 run function hook:boss/3/p2_tick
