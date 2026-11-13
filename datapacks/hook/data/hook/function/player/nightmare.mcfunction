#> hook:player/nightmare
# @s = ナイトメアで死んだプレイヤー。チェックポイントをこのステージの最初(cp/set が控えた storage hook: cp0)へ戻す(演出なし)
tag @s add hook.cp_quiet
function hook:cp/set with storage hook: cp0
tag @s remove hook.cp_quiet
