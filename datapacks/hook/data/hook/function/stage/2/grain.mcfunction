#> hook:stage/2/grain
# @s = プレイヤーが 2.5 以内に来た光の粒(item_display、tag hook.lore)。数え・演出・kill は hook:lore/pick
# 自分のタグを先に外す(pick が未実装・失敗でも毎 tick 呼ばない)。pick は読み込み時に無くても壊れないよう core/call 経由
tag @s remove hook.s2lore
function hook:core/call {f:"hook:lore/pick"}
