#> hook:stage/1/c/feed
# 選鉱場の投げる敵(in hook:world)。的が残っている間、居ない席にゾンビを出す(stage/1/tick から 5 秒ごと)
execute unless entity @e[tag=hook.s1f1] run function hook:stage/1/spawn {k:"zombie",x:270.5,y:71,z:12.5,t:"hook.s1f1"}
execute unless entity @e[tag=hook.s1f2] run function hook:stage/1/spawn {k:"zombie",x:283.5,y:71,z:16.5,t:"hook.s1f2"}
