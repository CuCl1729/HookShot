#> hook:combat/smash_enemy
# @s = 他の敵に高速でぶつかった敵(tag hook.self)。触れた敵を自分から離れる向きへ弾く(ビリヤード。怯み、死なない)。
# 怯んでいる敵は弾かない(弾いた相手に弾き返されて往復しないように)。ボスは hook:boss/hit
execute as @e[tag=hook.boss,tag=!hook.self,tag=!hook.dying,distance=..1.2] at @s run function hook:enemy/kill
scoreboard players operation #kv hook.temporary = #knock_v hook.cfg
execute as @e[tag=hook.enemy,tag=!hook.boss,tag=!hook.self,tag=!hook.dying,tag=!hook.stun,distance=..1.2] at @s facing entity @n[tag=hook.self] feet rotated ~180 -25 run function hook:combat/knock
