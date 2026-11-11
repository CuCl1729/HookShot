#> hook:boss/2/bar_show
# bossbar は構文の実例が無いので hook:core/call 経由で呼ぶ(壊れていても呼び出し側は動く)
bossbar remove hook:boss2
bossbar add hook:boss2 {text:"機巧の番人",color:"gold"}
bossbar set hook:boss2 color yellow
bossbar set hook:boss2 style notched_6
bossbar set hook:boss2 max 3
bossbar set hook:boss2 value 3
bossbar set hook:boss2 players @a
