#> hook:stage/0/summon_zombie
# @s = プレイヤー。フックで引かずにゾンビが倒れたので出し直す
tag @s remove hook.yanked
execute in hook:world positioned 26.5 68 0.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.tut
# 台から歩いてトゲへ自滅しないよう足止め(フックの Motion では動く)
effect give @e[tag=hook.new] minecraft:slowness infinite 255 true
tellraw @s [{text:"[師範] ",color:"yellow"},{text:"今のは勝手に落ちただけだ。フックを当てて引きずり落とせ。",color:"white"}]
