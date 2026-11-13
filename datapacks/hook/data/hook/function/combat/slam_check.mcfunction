#> hook:combat/slam_check
# @s = フックで動かされた直後(hook.mv > 0)の、物理で飛んでいる敵(弾かれた・突き飛ばされた・放された)。ボスは来ない。
# 水平の速さ(×100、|x|+|z|)が前 tick #slam_v 以上 → いま 1/3 未満 = 壁に激突(怯む)。速いまま怯んでいない他の敵に触れたら
# 相手を弾き、自分は止まって怯む(hook:combat/smash_hit)。どちらも死なない
execute store result score #mx hook.temporary run data get entity @s Motion[0] 100
execute store result score #a hook.temporary run data get entity @s Motion[2] 100
execute if score #mx hook.temporary matches ..-1 run scoreboard players operation #mx hook.temporary *= #-1 hook.constant
execute if score #a hook.temporary matches ..-1 run scoreboard players operation #a hook.temporary *= #-1 hook.constant
scoreboard players operation #mx hook.temporary += #a hook.temporary
scoreboard players operation #a hook.temporary = #mx hook.temporary
scoreboard players operation #a hook.temporary *= #3 hook.constant
execute if score @s hook.vh >= #slam_v hook.cfg if score #a hook.temporary < @s hook.vh run return run function hook:combat/slam
scoreboard players operation @s hook.vh = #mx hook.temporary
execute if score #mx hook.temporary < #slam_v hook.cfg run return 0
tag @s add hook.self
execute if entity @e[tag=hook.enemy,tag=!hook.self,tag=!hook.dying,tag=!hook.stun,distance=..1.2] run function hook:combat/smash_hit
tag @s remove hook.self
