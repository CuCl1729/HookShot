#> hook:stage/0/sp6z
# 爆弾兵で一網打尽にする、寄り集まったゾンビ3体
kill @e[tag=hook.tut6z]
execute in hook:world positioned 36.5 64 18.5 run function hook:enemy/summon/zombie
function hook:stage/0/dummy {t:"hook.p6z1",g:"hook.tut6z"}
execute in hook:world positioned 38.5 64 20.5 run function hook:enemy/summon/zombie
function hook:stage/0/dummy {t:"hook.p6z2",g:"hook.tut6z"}
execute in hook:world positioned 36.5 64 21.5 run function hook:enemy/summon/zombie
function hook:stage/0/dummy {t:"hook.p6z3",g:"hook.tut6z"}
