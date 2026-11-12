#> hook:dev/shoot
# @s = プレイヤー。@macro x/y/z = 狙う点(目の高さで狙うので y は狙う点 − 1.62 を渡す)。向けて記録を始め、撃つ
$tp @s ~ ~ ~ facing $(x) $(y) $(z)
function hook:dev/rec_start
execute at @s run function hook:hook/fire
