#> hook:boss/1/end
# 撃破演出(毎 tick、#dt)。1 欠片 / 80 能力1 / 160 評価 / 260 ステージ2へ(タイトルが重ならないよう間を空ける)
scoreboard players add #dt hook.b1 1
execute if score #dt hook.b1 matches 1 run function hook:boss/1/reward
execute if score #dt hook.b1 matches 80 run function hook:boss/1/ability
execute if score #dt hook.b1 matches 160 run function hook:boss/1/results
execute if score #dt hook.b1 matches 260.. run function hook:boss/1/leave
