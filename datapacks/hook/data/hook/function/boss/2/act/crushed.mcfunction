#> hook:boss/2/act/crushed
# @s = プレスに潰された番人。1.5 秒後に部屋の中央へ跳んで戻る
particle minecraft:electric_spark ~ ~3 ~ 0.6 0.6 0.6 0 3 force @a
execute if score #t hook.b2 matches 30 run particle minecraft:cloud ~ ~0.5 ~ 1 0.2 1 0.05 20 force @a
execute if score #t hook.b2 matches 30 run tp @s 841.5 64 0.5
execute if score #t hook.b2 matches 30 run data modify entity @s Motion set value [0.0d,0.0d,0.0d]
execute if score #t hook.b2 matches 30 run function hook:boss/2/set {a:0}
