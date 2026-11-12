#> hook:combat/yank_blocked
# @s = 引き寄せ中に壁へ当たった敵。速ければ叩きつけで撃破、遅ければ放す
execute if score @s hook.spd >= #slam_v hook.cfg run return run function hook:combat/slam
function hook:combat/drop
