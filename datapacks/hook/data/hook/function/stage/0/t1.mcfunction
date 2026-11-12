#> hook:stage/0/t1
# @s = 壁 x70 の的の目印(スイッチ)。投げた敵(tag hook.thrown、proj_switch の時点でまだ付いている)で当てたときだけ進む
execute unless entity @e[tag=hook.thrown,distance=..3] run return run tellraw @a[scores={hook.stage=0,hook.tut=4}] [{text:"▶ ",color:"aqua"},{text:"フックで撃っても扉は開かない。ゾンビを掴んで投げ当てろ。",color:"gray"}]
execute as @a[scores={hook.stage=0,hook.tut=4}] at @s run function hook:stage/0/s5
