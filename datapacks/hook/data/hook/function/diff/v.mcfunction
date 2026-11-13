#> hook:diff/v
# diff/apply の表を書き込む
$scoreboard players set #tele_pct hook.diff $(tele)
$scoreboard players set #boss_hp_add hook.diff $(hp_add)
$scoreboard players set #spd hook.diff $(spd)
$scoreboard players set #fuel_pct hook.diff $(fuel)
$scoreboard players set #hp hook.diff $(hp)
$data modify storage hook: diff set value {hp:$(hp),s:"$(s)",name:"$(name)",c:"$(c)"}
