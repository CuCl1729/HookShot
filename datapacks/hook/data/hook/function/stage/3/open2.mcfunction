#> hook:stage/3/open2
# @s = プレイヤー。W の重装兵が消えた → 足場 I5 を出す
# I5
execute in hook:world run fill 1092 73 -2 1098 73 2 minecraft:smooth_quartz
execute in hook:world run fill 1093 72 -1 1097 72 1 minecraft:calcite
execute in hook:world run fill 1095 74 0 1095 77 0 minecraft:quartz_pillar
execute in hook:world run fill 1095 78 0 1095 78 0 minecraft:sea_lantern
execute in hook:world run particle minecraft:electric_spark 1095.5 75 0.5 3 1 3 0 60 force @a
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"見事だ。止めて、ぶつけて、落とす。道が開いた。",color:"white"}]
