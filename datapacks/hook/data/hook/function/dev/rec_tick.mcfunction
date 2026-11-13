#> hook:dev/rec_tick
# @s = 記録中のプレイヤー(player/tick から。#x1/#y1/#z1 = いまの位置)
scoreboard players add #rec_t hook.temporary 1
execute if score #y1 hook.temporary > #rec_pk hook.temporary run scoreboard players operation #rec_pk hook.temporary = #y1 hook.temporary
execute if score #y1 hook.temporary > #rec_pk2 hook.temporary run scoreboard players operation #rec_pk2 hook.temporary = #y1 hook.temporary
execute if entity @s[tag=hook.floating] run scoreboard players add #rec_f hook.temporary 1
# 連続撃ち: 引いていなくて dev.q が残っていればすぐ次へ
execute unless entity @s[tag=hook.pulling] if data storage hook: dev.q[0] run function hook:dev/next
# 最初の到着より後で、まだ続きがあるのに地面に立った tick を数える
execute if score #rec_n hook.temporary matches 1.. if predicate hook:on_ground if entity @s[tag=hook.pulling] run scoreboard players add #rec_g hook.temporary 1
execute if score #rec_n hook.temporary matches 1.. if predicate hook:on_ground if entity @s[tag=hook.pulling] run tellraw @a ["  ground after arrival ",{score:{name:"#rec_n",objective:"hook.temporary"}}," pull t ",{score:{name:"@s",objective:"hook.pull"}}," y ",{score:{name:"#y1",objective:"hook.temporary"}}]
execute if score #rec_t hook.temporary matches 4.. if predicate hook:on_ground unless entity @s[tag=hook.pulling] unless score @s hook.hop matches 1.. run function hook:dev/report
execute if score #rec_t hook.temporary matches 400.. run function hook:dev/report
execute if score #rec_dbg hook.temporary matches 1.. run tellraw @a ["  v ",{score:{name:"#vx",objective:"hook.temporary"}}," ",{score:{name:"#vy",objective:"hook.temporary"}}," ",{score:{name:"#vz",objective:"hook.temporary"}}]
execute if score #rec_dbg hook.temporary matches 1.. run scoreboard players remove #rec_dbg hook.temporary 1
# 軌跡: #rec_tr tick の間、毎 tick 位置を出す(×100)
execute if score #rec_tr hook.temporary matches 1.. run tellraw @a ["tr ",{score:{name:"#rec_t",objective:"hook.temporary"}}," ",{score:{name:"#x1",objective:"hook.temporary"}}," ",{score:{name:"#y1",objective:"hook.temporary"}}," ",{score:{name:"#z1",objective:"hook.temporary"}}]
execute if score #rec_tr hook.temporary matches 1.. run scoreboard players remove #rec_tr hook.temporary 1
