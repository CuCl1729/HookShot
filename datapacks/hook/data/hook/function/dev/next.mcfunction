#> hook:dev/next
# @s = プレイヤー。dev.q の先頭へ向けて撃ち、先頭を消す
data modify storage hook: dev.p set from storage hook: dev.q[0]
data remove storage hook: dev.q[0]
function hook:dev/aim with storage hook: dev.p
execute at @s run function hook:hook/fire
