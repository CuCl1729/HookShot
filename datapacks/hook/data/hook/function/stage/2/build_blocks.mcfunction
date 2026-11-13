#> hook:stage/2/build_blocks
# hook:world で実行(範囲は hook:stage/2/build が空にしてある)。炉の「動いている」色は ochre_froglight、止めると polished_blackstone
# 入口
fill 600 63 -3 611 63 3 minecraft:polished_deepslate
fill 600 64 -4 600 70 4 minecraft:deepslate_tiles
# 大工場: 床・四方の壁(屋根なし)・入口
fill 612 63 -40 788 63 40 minecraft:polished_deepslate
fill 611 64 -41 611 104 41 minecraft:deepslate_tiles
fill 789 64 -41 789 104 41 minecraft:deepslate_tiles
fill 612 64 -41 788 104 -41 minecraft:deepslate_tiles
fill 612 64 41 788 104 41 minecraft:deepslate_tiles
fill 611 64 -2 611 67 2 minecraft:air
# 梁(北と南の翼の上を東西に走る。どこからでも掴まって移動できる)
fill 640 84 -13 720 86 -11 minecraft:waxed_cut_copper
fill 640 84 11 720 86 13 minecraft:waxed_cut_copper
# 中央の扉(東の壁)と炉のランプ(A 北 / B 高所 / C 南)
fill 789 64 -3 789 71 3 minecraft:iron_block
fill 788 73 -6 788 74 -5 minecraft:ochre_froglight
fill 788 73 -1 788 74 0 minecraft:ochre_froglight
fill 788 73 4 788 74 5 minecraft:ochre_froglight
# ハブの練習プレス
execute positioned 632 64 0 run function hook:gimmick/press/place

# A 圧延ライン(北): レールの上を炉心の台車が往復。プレス3基は撃ってから2秒後に落ちる(遅延)
fill 645 64 -28 676 64 -27 minecraft:rail[shape=east_west]
execute positioned 652 64 -28 run function hook:gimmick/press/place
execute positioned 660 64 -28 run function hook:gimmick/press/place
execute positioned 668 64 -28 run function hook:gimmick/press/place
execute positioned 660.5 71.5 -27.5 as @e[type=marker,tag=hook.switch,distance=..12] run data modify entity @s data.f set value "hook:stage/2/a/arm"
summon block_display 645.5 64 -27.5 {Tags:["hook.s2core","hook.s2fwd"],block_state:{id:"minecraft:ochre_froglight"},teleport_duration:1,transformation:{translation:[-1.0f,0.0f,-1.0f],scale:[2.0f,2.0f,2.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
# 炉 A(レールの東端)と北壁沿いのキャットウォーク(スケルトン)
fill 680 64 -32 686 72 -24 minecraft:polished_blackstone_bricks
fill 680 66 -30 680 70 -26 minecraft:ochre_froglight
fill 681 72 -29 685 72 -27 minecraft:ochre_froglight
fill 640 73 -40 700 73 -38 minecraft:waxed_cut_copper
# 光の粒 1: 炉 A の天面(北のキャットウォークから)。拾う判定は hook:stage/2/world
summon item_display 683.5 73.6 -28.5 {Tags:["hook.lore","hook.s2lore"],billboard:"center",brightness:{sky:15,block:15},item:{id:"minecraft:glowstone_dust",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.8f,0.8f,0.8f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}

# C 組立場(南): 高さ 16 の壁で囲ったアリーナ。入口 x 674〜678(戦闘中は鉄格子)。プレス4基、炉 C は南の壁に埋まって鉄格子の覆い
fill 640 64 14 712 79 14 minecraft:deepslate_tiles
fill 640 64 15 640 79 40 minecraft:deepslate_tiles
fill 712 64 15 712 79 40 minecraft:deepslate_tiles
fill 674 64 14 678 68 14 minecraft:air
execute positioned 652 64 27 run function hook:gimmick/press/place
execute positioned 668 64 27 run function hook:gimmick/press/place
execute positioned 684 64 27 run function hook:gimmick/press/place
execute positioned 700 64 27 run function hook:gimmick/press/place
fill 670 64 39 682 76 40 minecraft:polished_blackstone_bricks
fill 671 72 39 681 75 39 minecraft:ochre_froglight
fill 675 66 36 678 69 39 minecraft:iron_bars hollow
execute positioned 676 67 37 align xyz run function hook:stage/2/cube {f:"hook:stage/2/c/stop"}
# 光の粒 2: 東端のプレスの筐体の天面(中心の鎖を避けて北西寄り)
summon item_display 698.5 73.6 25.5 {Tags:["hook.lore","hook.s2lore"],billboard:"center",brightness:{sky:15,block:15},item:{id:"minecraft:glowstone_dust",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.8f,0.8f,0.8f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}

# B 高所(東): 柱 B1(天面 y 81)→ 浮き台 B1b(y 91)→ 浮き台 B2(y 102)→ 往復するクレーン(天面 y 104、中心 z 20〜-18)→ 炉の台 B3(y 111)
# B2 と B3 は 60 離れていて射程 40 では届かない。クレーンが中ほど(中心 z 8〜-10、約 7 秒)にいる間だけ乗り継げる。床から B2 より上へは届かない
fill 770 64 33 772 80 35 minecraft:waxed_copper_block
# 柱の頭と浮き台は奥行き 4 以上(新しい跳ねは前へ約 4 進むので 3x3 だと越えて落ちる)
fill 769 80 32 773 80 36 minecraft:waxed_copper_block
fill 762 88 34 765 90 38 minecraft:waxed_cut_copper
fill 756 99 30 760 101 34 minecraft:waxed_cut_copper
# 光の粒 3: 東の壁際の小さな浮き台(天面 y 96。B2・B1b から約 27 の寄り道)
fill 775 93 12 779 95 16 minecraft:waxed_cut_copper
summon item_display 777.5 96.6 13.5 {Tags:["hook.lore","hook.s2lore"],billboard:"center",brightness:{sky:15,block:15},item:{id:"minecraft:glowstone_dust",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.8f,0.8f,0.8f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
# クレーンのレール(見た目だけ。block_display なのでフックは当たらない)・吊り鎖・台
summon block_display 760 112 -19 {block_state:{id:"minecraft:iron_block"},transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.0f,1.0f,41.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
summon block_display 760 104 20 {Tags:["hook.s2chain"],block_state:{id:"minecraft:iron_chain"},teleport_duration:8,transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.0f,8.0f,1.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
summon marker 760.5 102 20.5 {Tags:["hook.s2crane","hook.s2fwd"]}
fill 758 102 18 762 103 22 minecraft:yellow_concrete
fill 756 108 -38 764 110 -30 minecraft:polished_blackstone_bricks
fill 758 111 -37 762 114 -34 minecraft:polished_blackstone_bricks
fill 758 113 -34 762 113 -34 minecraft:ochre_froglight
fill 759 114 -36 761 114 -35 minecraft:ochre_froglight
execute positioned 759 111 -32 align xyz run function hook:stage/2/cube {f:"hook:stage/2/b/stop"}

# 前室(ボス戦のやり直し地点 810.5)
fill 789 63 -5 819 63 5 minecraft:polished_deepslate
fill 790 64 -6 818 70 -6 minecraft:deepslate_tiles
fill 790 64 6 818 70 6 minecraft:deepslate_tiles
# ボス部屋: 両側の壁沿いにプレス 8 基(範囲 z 8〜12 / -12〜-8)。中央 z -7〜7 は空き
fill 820 63 -13 862 63 13 minecraft:polished_deepslate
fill 819 64 -14 863 84 -14 minecraft:deepslate_tiles
fill 819 64 14 863 84 14 minecraft:deepslate_tiles
fill 819 64 -14 819 84 14 minecraft:deepslate_tiles
fill 863 64 -14 863 84 14 minecraft:deepslate_tiles
fill 819 64 -1 819 66 1 minecraft:air
# ガラスの天井(壁の上端を撃って跳ね越え、部屋の外へ落ちて戦闘がやり直しになるのを防ぐ)
fill 819 85 -14 863 85 14 minecraft:glass
execute positioned 825 64 -10 run function hook:gimmick/press/place
execute positioned 836 64 -10 run function hook:gimmick/press/place
execute positioned 847 64 -10 run function hook:gimmick/press/place
execute positioned 858 64 -10 run function hook:gimmick/press/place
execute positioned 825 64 10 run function hook:gimmick/press/place
execute positioned 836 64 10 run function hook:gimmick/press/place
execute positioned 847 64 10 run function hook:gimmick/press/place
execute positioned 858 64 10 run function hook:gimmick/press/place
