#> hook:stage/2/room/1
# @s = プレイヤー。能力1の練習: 谷の柱台の重装兵(足止め)。倒すと門 x 645 が開く
data modify storage hook: s2.r1 set value 1b
execute in hook:world positioned 628.5 64 0.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s2
tag @e[tag=hook.new] add hook.s2r1
# 台から歩いて落ちないよう足止め(フックの Motion では動く)
effect give @e[tag=hook.new] minecraft:slowness infinite 255 true
# 飛び込んだ直後に斧で殴られると、狭い柱台から谷へ押し出されるので攻撃させない(練習台)
effect give @e[tag=hook.new] minecraft:weakness infinite 255 true
tellraw @s [{text:"[声] ",color:"aqua"},{text:"…巨兵を倒した者か。私は工場に閉じ込められた技師の残響。あの番人を止めてほしい。",color:"white"}]
tellraw @s [{text:"[声] ",color:"aqua"},{text:"巨兵から得た力「ヘビーインパクト」を試せ。柱台の重装兵にフックを当てて飛び込めば、ぶつかった勢いで突き飛ばせる。谷へ落とせ。",color:"white"}]
