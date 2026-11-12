#> hook:boss/3/dash_hit
# @s = 突進に触れたプレイヤー(1 回の突進で一度だけ)
tag @s add hook.b3hit
function hook:core/call {f:"hook:boss/3/hurt"}
