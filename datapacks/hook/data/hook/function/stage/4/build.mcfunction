#> hook:stage/4/build
# 虚の玉座(hook:world, 前室 x 1500〜1515 / 闘技場 x 1516〜1584, z ±16, 床 y 63)を第1形態の姿に建てる。冪等。
# start が forceload したチャンクが読み込まれるまでは何もしない
execute in hook:world unless loaded 1500 63 -16 run return 0
execute in hook:world unless loaded 1500 63 16 run return 0
execute in hook:world unless loaded 1584 63 -16 run return 0
execute in hook:world unless loaded 1584 63 16 run return 0
# 前室と橋(門 = x 1514 の鉄格子、戦闘中だけ閉じる)
execute in hook:world run fill 1500 63 -5 1512 63 5 minecraft:polished_blackstone_bricks
execute in hook:world run fill 1500 64 -5 1512 68 5 minecraft:air
execute in hook:world run setblock 1506 63 0 minecraft:sea_lantern
execute in hook:world run fill 1513 63 -1 1515 63 1 minecraft:polished_blackstone_bricks
execute in hook:world run fill 1513 64 -1 1515 66 1 minecraft:air
# 闘技場の床と低い壁(第1形態)。トゲを先に消す(土台ごと消すと欠片がアイテムで落ちる)
execute in hook:world run fill 1516 64 -16 1584 64 16 minecraft:air replace minecraft:amethyst_cluster
execute in hook:world run fill 1516 62 -16 1584 68 16 minecraft:air
execute in hook:world run fill 1516 63 -16 1584 63 16 minecraft:polished_blackstone
execute in hook:world run fill 1516 64 -16 1584 65 -16 minecraft:polished_blackstone_bricks
execute in hook:world run fill 1516 64 16 1584 65 16 minecraft:polished_blackstone_bricks
execute in hook:world run fill 1516 64 -16 1516 65 16 minecraft:polished_blackstone_bricks
execute in hook:world run fill 1584 64 -16 1584 65 16 minecraft:polished_blackstone_bricks
execute in hook:world run fill 1516 64 -1 1516 65 1 minecraft:air
execute in hook:world run function hook:stage/4/islands
# プレス(上がった状態に戻す)
execute in hook:world positioned 1537 64 11 run function hook:gimmick/press/place
execute in hook:world positioned 1563 64 -11 run function hook:gimmick/press/place
data modify storage hook: built.s4 set value 1b
