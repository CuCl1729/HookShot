#> hook:cp/return
# @s = プレイヤー。落下・死亡時にチェックポイントへ無傷で戻す
function hook:hook/release
scoreboard players set @s hook.death 0
function hook:cp/tp with storage hook: cp
