#> hook:player/tick
# @s = プレイヤー(実行位置も @s)
execute if score @s hook.cd matches 1.. run scoreboard players remove @s hook.cd 1
execute if entity @s[tag=hook.pulling] run function hook:hook/pull_tick
execute store result score @s hook.y run data get entity @s Pos[1]
execute if dimension hook:world if score @s hook.y matches ..31 run function hook:cp/return
# 攻撃不可: エンティティ操作距離0で敵に届かない(base は保存されるが、既存プレイヤー用に定期的にも)
execute if score #tick hook.temporary matches 0 run attribute @s minecraft:entity_interaction_range base set 0
