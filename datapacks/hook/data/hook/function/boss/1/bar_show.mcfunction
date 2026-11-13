#> hook:boss/1/bar_show
# hook:core/call 経由(bossbar の構文は実例未確認のため隔離)。add は既にあれば失敗するだけ
bossbar add hook:boss1 {text:"水晶の巨兵",color:"light_purple"}
bossbar set hook:boss1 name {text:"水晶の巨兵",color:"light_purple"}
bossbar set hook:boss1 color purple
execute store result bossbar hook:boss1 max run scoreboard players get #hp hook.b1
execute store result bossbar hook:boss1 value run scoreboard players get #hp hook.b1
bossbar set hook:boss1 players @a
bossbar set hook:boss1 visible true
