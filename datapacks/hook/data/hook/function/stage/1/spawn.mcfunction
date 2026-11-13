#> hook:stage/1/spawn
# @macro k = 種類(zombie/skeleton/bomber/heavy)/ x y z / t = 付けるタグ。hook.s1 も付け、hook.new は使い終える(続けて出せるように)
$execute in hook:world positioned $(x) $(y) $(z) run function hook:enemy/summon/$(k)
$execute in hook:world run particle minecraft:portal $(x) $(y) $(z) 0.3 1 0.3 0.5 40 force @a
$tag @e[tag=hook.new] add $(t)
tag @e[tag=hook.new] add hook.s1
tag @e[tag=hook.new] remove hook.new
