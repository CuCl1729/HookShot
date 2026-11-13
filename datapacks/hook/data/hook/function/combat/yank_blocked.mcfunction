#> hook:combat/yank_blocked
# @s = 引き寄せ中に壁へ当たった敵。放す。速ければ怯む(叩きつけ。死なない)
function hook:combat/drop
execute if score @s hook.spd >= #slam_v hook.cfg run function hook:combat/slam
