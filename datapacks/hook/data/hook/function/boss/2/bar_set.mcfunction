#> hook:boss/2/bar_set
# 構文の実例が無いので hook:core/call 経由で呼ぶ
execute store result bossbar hook:boss2 value run scoreboard players get #hp hook.b2
