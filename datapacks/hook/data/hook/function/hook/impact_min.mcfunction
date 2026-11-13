#> hook:hook/impact_min
# @s = 突っ込まれた重い敵(向き = プレイヤーから離れる水平の向き)。#ix/#iz を その向き × #impact_min にする
function hook:util/dir
scoreboard players operation #ix hook.temporary = #dx hook.temporary
scoreboard players operation #iz hook.temporary = #dz hook.temporary
scoreboard players operation #ix hook.temporary *= #impact_min hook.cfg
scoreboard players operation #iz hook.temporary *= #impact_min hook.cfg
scoreboard players operation #ix hook.temporary /= #1000 hook.constant
scoreboard players operation #iz hook.temporary /= #1000 hook.constant
