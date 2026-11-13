#> hook:boss/2/bar_show
# bossbar は構文の実例が無いので hook:core/call 経由で呼ぶ(壊れていても呼び出し側は動く)。最大 = 開始時の #hp(難易度で 3〜5)
bossbar remove hook:boss2
bossbar add hook:boss2 {text:"機巧の番人",color:"gold"}
bossbar set hook:boss2 color yellow
bossbar set hook:boss2 style progress
execute store result bossbar hook:boss2 max run scoreboard players get #hp hook.b2
execute store result bossbar hook:boss2 value run scoreboard players get #hp hook.b2
bossbar set hook:boss2 players @a
