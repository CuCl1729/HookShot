#> hook:hook/float
# @s = 引かれていないプレイヤー。空中でスニーク中は低速落下でふわっと浮く(燃料 hook.fuel、着地で満タン)。
# tag hook.dev_float = スニーク扱い(計測用。ツールでスニークを押し続けられないため)
execute if predicate hook:on_ground run scoreboard players operation @s hook.fuel = #fuel hook.cfg
execute if predicate hook:on_ground run return run function hook:hook/float_end
execute unless predicate hook:sneak unless entity @s[tag=hook.dev_float] run return run function hook:hook/float_end
execute if score @s hook.fuel matches ..0 run return run function hook:hook/float_end
# 浮き始めは落下を止める(すでに付いた下向きの速さは低速落下では消えないため)
execute unless entity @s[tag=hook.floating] if score #vy hook.temporary matches ..-1 run function hook:hook/float_brake
tag @s add hook.floating
scoreboard players remove @s hook.fuel 1
effect give @s minecraft:slow_falling 1 0 true
particle minecraft:cloud ~ ~ ~ 0.2 0 0.2 0 1 force @a
scoreboard players operation #f hook.temporary = @s hook.fuel
scoreboard players operation #f hook.temporary *= #4 hook.constant
scoreboard players operation #f hook.temporary /= #fuel hook.cfg
execute if score #f hook.temporary matches 3.. run title @s actionbar {text:"フロート ■■■■",color:"aqua"}
execute if score #f hook.temporary matches 2 run title @s actionbar {text:"フロート ■■■□",color:"aqua"}
execute if score #f hook.temporary matches 1 run title @s actionbar {text:"フロート ■■□□",color:"aqua"}
execute if score #f hook.temporary matches 0 if score @s hook.fuel matches 1.. run title @s actionbar {text:"フロート ■□□□",color:"yellow"}
execute if score @s hook.fuel matches 0 run title @s actionbar {text:"フロート □□□□",color:"red"}
