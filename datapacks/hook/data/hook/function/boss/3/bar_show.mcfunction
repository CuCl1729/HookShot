#> hook:boss/3/bar_show
# hook:core/call 経由(壊れていても呼び出し側は動く)
bossbar remove hook:boss3
bossbar add hook:boss3 {text:"虚の王",color:"dark_purple"}
bossbar set hook:boss3 color purple
bossbar set hook:boss3 style notched_6
# 最大 = #max(6 + 難易度の加算)。6 のときだけ目盛り 6
execute store result bossbar hook:boss3 max run scoreboard players get #max hook.b3
execute store result bossbar hook:boss3 value run scoreboard players get #hp hook.b3
execute unless score #max hook.b3 matches 6 run bossbar set hook:boss3 style progress
bossbar set hook:boss3 players @a
