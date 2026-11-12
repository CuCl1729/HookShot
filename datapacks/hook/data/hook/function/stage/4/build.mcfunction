#> hook:stage/4/build
# hook:world で実行。虚の玉座(前室 x 1500〜1515 / 闘技場 x 1516〜1584, z ±16, 床 y 63)を第1形態の姿に建てる。
# 冪等: 担当範囲 x 1500〜1599, y 60〜80, z ±24 をまず消してから建てる(fill の上限 32768 に収まるよう 4 つに分ける)
# start が forceload したチャンクが読み込まれるまでは何もしない
execute unless loaded 1500 63 -24 run return 0
execute unless loaded 1500 63 24 run return 0
execute unless loaded 1599 63 -24 run return 0
execute unless loaded 1599 63 24 run return 0
kill @e[tag=hook.b3x]
# トゲを先に消す(土台ごと消すと欠片がアイテムで落ちる)
fill 1500 60 -24 1524 80 24 minecraft:air replace minecraft:amethyst_cluster
fill 1525 60 -24 1549 80 24 minecraft:air replace minecraft:amethyst_cluster
fill 1550 60 -24 1574 80 24 minecraft:air replace minecraft:amethyst_cluster
fill 1575 60 -24 1599 80 24 minecraft:air replace minecraft:amethyst_cluster
fill 1500 60 -24 1524 80 24 minecraft:air
fill 1525 60 -24 1549 80 24 minecraft:air
fill 1550 60 -24 1574 80 24 minecraft:air
fill 1575 60 -24 1599 80 24 minecraft:air
fill 1550 90 -6 1570 102 6 minecraft:air
kill @e[type=marker,tag=hook.s5m]
# 前室と橋(門 = x 1514 の鉄格子、戦闘中だけ閉じる)
fill 1500 63 -5 1512 63 5 minecraft:polished_blackstone_bricks
setblock 1506 63 0 minecraft:sea_lantern
fill 1513 63 -1 1515 63 1 minecraft:polished_blackstone_bricks
# 闘技場の床と壁(高さ 4。外へ飛び出して奈落へ落ちにくく、壁の上端はフック点になる)
fill 1516 63 -16 1584 63 16 minecraft:polished_blackstone
fill 1516 64 -16 1584 67 -16 minecraft:polished_blackstone_bricks
fill 1516 64 16 1584 67 16 minecraft:polished_blackstone_bricks
fill 1516 64 -16 1516 67 16 minecraft:polished_blackstone_bricks
fill 1584 64 -16 1584 67 16 minecraft:polished_blackstone_bricks
fill 1516 64 -1 1516 66 1 minecraft:air
function hook:stage/4/islands
# 宙のフック点(崩落の消去範囲 y 62〜68 より上なので第2形態でも残る。プレスの筐体 y 71〜76 とは重ならない)
setblock 1530 74 0 minecraft:crying_obsidian
setblock 1570 74 0 minecraft:crying_obsidian
setblock 1550 76 -12 minecraft:crying_obsidian
setblock 1550 76 12 minecraft:crying_obsidian
setblock 1541 72 -3 minecraft:crying_obsidian
setblock 1559 72 3 minecraft:crying_obsidian
# プレス(上がった状態に戻す)
execute positioned 1537 64 11 run function hook:gimmick/press/place
execute positioned 1563 64 -11 run function hook:gimmick/press/place
kill @e[type=item,x=1500,y=40,z=-32,dx=99,dy=80,dz=63]
data modify storage hook: built.s4 set value 1b
