#> hook:dev/shoot_look
# 試験用。@s = プレイヤー。@macro x/y/z = 狙う点(y は −1.62 済み)、yaw = 撃った直後に向く向き(人が着地点の方を見る操作の代わり。跳ねる向きになる)
$tp @s ~ ~ ~ facing $(x) $(y) $(z)
function hook:dev/rec_start
execute at @s run function hook:hook/fire
$rotate @s $(yaw) 0
