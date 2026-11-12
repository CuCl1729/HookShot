#> hook:hook/stuck_check
# @s = 引かれているプレイヤー。#t = 引き始めてからの tick。速さ(各軸の絶対値の和)が #stuck_v 未満なら hook.stuck を数える
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
