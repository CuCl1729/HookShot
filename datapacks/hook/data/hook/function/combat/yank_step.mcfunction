#> hook:combat/yank_step
# @s = 引き寄せ中の敵(tag hook.self)。実行位置 = いまの足、向き = 掴む位置へ。0.5 進む(#steps 回まで)
execute positioned ^ ^ ^0.5 unless block ~ ~0.2 ~ #hook:pass run return run function hook:combat/yank_blocked
execute positioned ^ ^ ^0.5 unless block ~ ~1.2 ~ #hook:pass run return run function hook:combat/yank_blocked
execute if score @s hook.spd >= #slam_v hook.cfg positioned ^ ^ ^0.5 if entity @e[tag=hook.enemy,tag=!hook.self,tag=!hook.dying,distance=..1.2] run return run function hook:combat/smash_enemy
tp @s ^ ^ ^0.5
scoreboard players remove #steps hook.temporary 1
execute if score #steps hook.temporary matches 1.. at @s unless entity @n[type=marker,tag=hook.hp,distance=..0.6] facing entity @n[type=marker,tag=hook.hp] feet run function hook:combat/yank_step
