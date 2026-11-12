#> hook:boss/3/roll
# #r hook.b3 = 0〜99 の乱数(構文の実例が無いので hook:core/call 経由で呼ぶ。失敗しても前の値のまま)
execute store result score #r hook.b3 run random value 0..99
