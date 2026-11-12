#> hook:dev/drop
# @s = プレイヤー。(1810.5, 90, 0.5) から落として記録する(フロートの滞空を測る。hook.dev_float を付けて使う)
tp @s 1810.5 90 0.5 -90 0
function hook:dev/rec_start
