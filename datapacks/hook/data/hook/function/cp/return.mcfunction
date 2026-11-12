#> hook:cp/return
# @s = プレイヤー。落下・死亡時にチェックポイントへ無傷で戻す
function hook:hook/release
execute as @e[tag=hook.yanking] run function hook:combat/drop
execute as @e[tag=hook.grabbed] run function hook:combat/drop
scoreboard players set @s hook.death 0
function hook:cp/tp with storage hook: cp
