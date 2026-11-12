#> hook:combat/smash_enemy
# @s = 他の敵に高速でぶつかった敵(tag hook.self)。実行位置 = ぶつかった所。双方撃破(ボスは hook:boss/hit)
execute as @e[tag=hook.enemy,tag=!hook.self,tag=!hook.dying,distance=..1.2] at @s run function hook:enemy/kill
function hook:combat/slam
