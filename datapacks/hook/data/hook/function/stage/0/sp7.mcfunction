#> hook:stage/0/sp7
# 島の鉄の台に立つ重装兵(飛び移る的)
tag @a remove hook.grabbed_heavy
execute in hook:world positioned 5.5 64 29.5 run function hook:enemy/summon/heavy
function hook:stage/0/dummy {t:"hook.p7",g:"hook.tut7"}
