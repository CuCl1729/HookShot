#> hook:hook/float
# @s = 引かれていないプレイヤー。空中でスニーク中はゆっくり上がる(#float_vy。燃料 hook.fuel、着地で満タン。切れたら普通に落ちる)。横は押さない
# tag hook.dev_float = スニーク扱い(計測用。ツールでスニークを押し続けられないため)
execute if predicate hook:on_ground run scoreboard players operation @s hook.fuel = #fuel hook.cfg
execute if predicate hook:on_ground run return run function hook:hook/float_end
execute unless predicate hook:sneak unless entity @s[tag=hook.dev_float] run return run function hook:hook/float_end
execute if score @s hook.fuel matches ..0 run return run function hook:hook/float_end
# それより速く上がっている間(跳ねの途中)は押さない
execute if score #vy hook.temporary < #float_vy hook.cfg run function hook:hook/float_hold
tag @s add hook.floating
scoreboard players remove @s hook.fuel 1
particle minecraft:cloud ~ ~ ~ 0.2 0 0.2 0 1 force @a
scoreboard players operation #f hook.temporary = @s hook.fuel
scoreboard players operation #f hook.temporary *= #4 hook.constant
scoreboard players operation #f hook.temporary /= #fuel hook.cfg
execute if score #f hook.temporary matches 3.. run title @s actionbar {text:"フロート ■■■■",color:"aqua"}
execute if score #f hook.temporary matches 2 run title @s actionbar {text:"フロート ■■■□",color:"aqua"}
execute if score #f hook.temporary matches 1 run title @s actionbar {text:"フロート ■■□□",color:"aqua"}
execute if score #f hook.temporary matches 0 if score @s hook.fuel matches 1.. run title @s actionbar {text:"フロート ■□□□",color:"yellow"}
execute if score @s hook.fuel matches 0 run title @s actionbar {text:"フロート □□□□",color:"red"}
