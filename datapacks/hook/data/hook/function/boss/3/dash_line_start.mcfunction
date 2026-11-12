#> hook:boss/3/dash_line_start
# @s = 王(実行の向き = 突進の向き)。突進の通り道に炎の線を引く
scoreboard players set #i hook.b3 0
execute positioned ^ ^0.3 ^1.5 run function hook:boss/3/dash_line
