#> hook:boss/2/set
# @macro a: 次の行動(#act)。経過 #t を 0 に、前の行動の目印を消す
$scoreboard players set #act hook.b2 $(a)
scoreboard players set #t hook.b2 0
kill @e[tag=hook.b2m]
