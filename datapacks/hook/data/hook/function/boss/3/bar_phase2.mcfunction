#> hook:boss/3/bar_phase2
bossbar set hook:boss3 name {text:"虚の王 ― 真なる虚",color:"red"}
bossbar set hook:boss3 color red
execute store result bossbar hook:boss3 value run scoreboard players get #hp hook.b3
