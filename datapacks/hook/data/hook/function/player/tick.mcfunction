#> hook:player/tick
# @s = プレイヤー(実行位置も @s)
# hook.held = 右クリックを押し続けている(hook/use が 2 にする。離すと 2 tick で 0)
execute if score @s hook.held matches 1.. run scoreboard players remove @s hook.held 1
function hook:player/vel
# hook.sneak_new = スニークを押した瞬間の tick だけ(引き・掴みの中断用。フロート中に撃っても押しっぱなしでは切れない)
tag @s remove hook.sneak_new
execute if predicate hook:sneak unless entity @s[tag=hook.sneak_prev] run tag @s add hook.sneak_new
tag @s remove hook.sneak_prev
execute if predicate hook:sneak run tag @s add hook.sneak_prev
# 1 プレイヤー 1 tick に push は1回だけ(後の push が前を上書きする)。引き中はフロートしない
execute unless entity @s[tag=hook.pulling] if score @s hook.hop matches 1.. run function hook:hook/hop_tick
execute if entity @s[tag=hook.pulling] run function hook:hook/pull_tick
execute unless entity @s[tag=hook.pulling] unless score @s hook.hop matches 1.. run function hook:hook/float
execute unless entity @e[tag=hook.yanking] unless entity @e[tag=hook.grabbed] run tag @s remove hook.owner
execute if entity @s[tag=hook.rec] run function hook:dev/rec_tick
execute store result score @s hook.y run data get entity @s Pos[1]
execute if dimension hook:world if score @s hook.y matches ..31 run function hook:cp/return
# 攻撃不可: エンティティ操作距離0で敵に届かない(base は保存されるが、既存プレイヤー用に定期的にも)
execute if score #tick hook.temporary matches 0 run attribute @s minecraft:entity_interaction_range base set 0
