#> hook:boss/3/bar_show
# boss/2 と同じく hook:core/call 経由(壊れていても呼び出し側は動く)
bossbar remove hook:boss3
bossbar add hook:boss3 {text:"虚の王",color:"dark_purple"}
bossbar set hook:boss3 color purple
bossbar set hook:boss3 style notched_6
bossbar set hook:boss3 max 4
bossbar set hook:boss3 value 4
bossbar set hook:boss3 players @a
