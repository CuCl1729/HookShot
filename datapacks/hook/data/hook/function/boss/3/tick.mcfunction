#> hook:boss/3/tick
# 毎 tick(hook:stage/4/tick から。実行次元は overworld なので座標を使うものは in hook:world で)
# 闘技場 = x 1516〜1584, z ±16(落下中も含めるため y 0〜128)。入ると開始、戦闘中に誰もいなくなったらやり直し
execute if score #state hook.b3 matches 4 run return 0
execute if score #state hook.b3 matches 0 in hook:world if entity @a[scores={hook.stage=4},x=1516,y=0,z=-17,dx=69,dy=128,dz=34] run return run function hook:boss/3/start
execute unless score #state hook.b3 matches 1..3 run return 0
# 死亡(hook.b3d = 死亡数。core が hook.death を先に0にするので別に数える)。第2形態なら第2形態の頭から
execute as @a[scores={hook.b3d=1..}] run function hook:boss/3/died
execute unless score #state hook.b3 matches 1..3 run return 0
# やり直しの判定は門の内側の橋(x 1515)も含める
execute in hook:world unless entity @a[scores={hook.stage=4},x=1514,y=0,z=-17,dx=71,dy=128,dz=34] run return run function hook:boss/3/reset
execute unless entity @e[tag=hook.boss3] run return run function hook:boss/3/reset
execute if score #inv hook.b3 matches 1.. run scoreboard players remove #inv hook.b3 1
execute if score #state hook.b3 matches 2 in hook:world run return run function hook:boss/3/shift_tick
# 第2形態はスタンチェインで縛る(フック命中)だけで怯む。第1形態は手下を投げ当てたときだけ
execute if score #grd hook.b3 matches 1.. run scoreboard players remove #grd hook.b3 1
# (#grd = 第2形態で縛っても怯まない残り tick。開始直後・傷のあと・怯みが解けた直後に一撃で終わらないように。投げ・爆弾は通る)
execute if score #state hook.b3 matches 3 if score #stag hook.b3 matches 0 if score #grd hook.b3 matches 0 if entity @e[tag=hook.boss3,tag=hook.stun] run function hook:boss/3/stagger
# 突き飛ばし(能力1)は怯み中だけ通す。それ以外は同じ tick のうちに Motion を消す
execute as @e[tag=hook.boss3,tag=hook.impacted] at @s run function hook:boss/3/knocked
execute if score #stag hook.b3 matches 1.. in hook:world run return run function hook:boss/3/dazed
execute in hook:world run function hook:boss/3/act
