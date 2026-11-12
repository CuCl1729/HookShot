#> hook:stage/0/dummy
# @macro t: 位置の札(stage/0/tick が台へ戻す)/ g: 段階の札。直前に hook:enemy/summon/* で出した敵(tag hook.new)を的にする。
# 足を止める(movement_speed 0。AI は生きている)。hook.new はここで使い終える(続けて別の敵を出すため)
$tag @e[tag=hook.new] add $(t)
$tag @e[tag=hook.new] add $(g)
tag @e[tag=hook.new] add hook.tut
execute as @e[tag=hook.new] run attribute @s minecraft:movement_speed base set 0
tag @e[tag=hook.new] remove hook.new
