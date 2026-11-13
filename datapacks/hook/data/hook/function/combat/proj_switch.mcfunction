#> hook:combat/proj_switch
# @s = 目印 hook.proj。実行位置 = 標的ブロックの中。フックで撃ったのと同じくスイッチを作動させ(投げた敵は tag hook.thrown のまま)、
# 投げた敵は跳ね返って怯む(死なない。爆弾兵は爆発)
function hook:hook/switch
tp @s ~ ~ ~ ~180 ~
function hook:combat/proj_land
