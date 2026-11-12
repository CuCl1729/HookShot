#> hook:dev/spawn
# @macro kind = zombie / skeleton / bomber / heavy, x/y/z = 位置, tag = 付ける目印(試験で狙う用)
$execute in hook:world positioned $(x) $(y) $(z) run function hook:enemy/summon/$(kind)
$tag @e[tag=hook.new] add $(tag)
tag @e[tag=hook.new] remove hook.new
