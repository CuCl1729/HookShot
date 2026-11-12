#> hook:boss/2/act/dazed
# @s = 動けない番人。頭の上に火花。#dz 経って起き上がる
execute if score #t hook.b2 matches 1.. run particle minecraft:electric_spark ~ ~4.2 ~ 0.4 0.1 0.4 0 2 force @a
execute if score #t hook.b2 >= #dz hook.b2 run function hook:boss/2/set {a:0}
