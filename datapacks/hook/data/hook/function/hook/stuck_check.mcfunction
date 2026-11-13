#> hook:hook/stuck_check
# @s = 引かれているプレイヤー。#t = 引き始めてからの tick。速さ(各軸の絶対値の和)が #stuck_v 未満なら hook.stuck を数える
# 位置が全く変わらない tick はクライアントの詰まり(hook.stuck は数えも戻しもしない。数えると引きの途中で詰まり終了して、残った勢いで飛ばされた)。
# ただし続けて #still tick 変わらなければ本当に塞がれている(地上から塞がれた線の先を撃った等)ので pull_tick が終える。hook.still = 続けて止まっている tick
execute if score #vx hook.temporary matches 0 if score #vy hook.temporary matches 0 if score #vz hook.temporary matches 0 run return run scoreboard players add @s hook.still 1
scoreboard players set @s hook.still 0
scoreboard players operation #l1 hook.temporary = #vx hook.temporary
execute if score #l1 hook.temporary matches ..-1 run scoreboard players operation #l1 hook.temporary *= #-1 hook.constant
scoreboard players operation #a hook.temporary = #vy hook.temporary
execute if score #a hook.temporary matches ..-1 run scoreboard players operation #a hook.temporary *= #-1 hook.constant
scoreboard players operation #l1 hook.temporary += #a hook.temporary
scoreboard players operation #a hook.temporary = #vz hook.temporary
execute if score #a hook.temporary matches ..-1 run scoreboard players operation #a hook.temporary *= #-1 hook.constant
scoreboard players operation #l1 hook.temporary += #a hook.temporary
# 引き始めの数 tick はまだ遅いので数えない
execute if score #t hook.temporary matches ..3 run scoreboard players set #l1 hook.temporary 9999
execute if score #l1 hook.temporary < #stuck_v hook.cfg run scoreboard players add @s hook.stuck 1
execute if score #l1 hook.temporary >= #stuck_v hook.cfg run scoreboard players set @s hook.stuck 0
