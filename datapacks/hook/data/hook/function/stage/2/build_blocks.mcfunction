#> hook:stage/2/build_blocks
# hook:world で実行。hook:stage/2/build から
# A 入口
fill 600 63 -5 616 63 5 minecraft:polished_deepslate
fill 600 64 -5 600 70 5 minecraft:deepslate_tiles
# 谷の柱台(重装兵が立つ)
fill 625 63 -2 629 63 2 minecraft:waxed_cut_copper
fill 627 50 0 627 62 0 minecraft:iron_chain
# R2 プレスの間
fill 640 63 -8 690 63 8 minecraft:polished_deepslate
fill 645 64 -8 645 77 8 minecraft:deepslate_tiles
fill 645 64 -1 645 66 1 minecraft:iron_bars
fill 691 64 -8 691 77 8 minecraft:deepslate_tiles
fill 691 64 -1 691 66 1 minecraft:iron_bars
execute positioned 668 64 0 run function hook:gimmick/press/place
# R3 ベルトの谷(浮き台の奥の柱を撃って渡る)
fill 692 63 -3 696 63 3 minecraft:polished_deepslate
fill 705 63 -2 709 63 2 minecraft:waxed_cut_copper
fill 709 64 0 709 68 0 minecraft:waxed_copper_block
fill 718 63 -2 722 63 2 minecraft:waxed_cut_copper
fill 722 64 0 722 68 0 minecraft:waxed_copper_block
# R4 鍛造ライン(入口のアーチの梁を撃って渡る)
fill 731 63 -6 775 63 6 minecraft:polished_deepslate
fill 733 64 -4 733 69 -4 minecraft:deepslate_tiles
fill 733 64 4 733 69 4 minecraft:deepslate_tiles
fill 733 69 -4 733 69 4 minecraft:deepslate_tiles
execute positioned 745 64 0 run function hook:gimmick/press/place
execute positioned 756 64 0 run function hook:gimmick/press/place
execute positioned 767 64 0 run function hook:gimmick/press/place
# R5 煙突(柱を撃って登る)
fill 783 69 -2 787 69 2 minecraft:waxed_cut_copper
fill 787 70 0 787 75 0 minecraft:waxed_copper_block
fill 785 50 0 785 68 0 minecraft:iron_chain
# 前室
fill 793 75 -5 818 75 5 minecraft:polished_deepslate
fill 797 76 0 797 81 0 minecraft:waxed_copper_block
# ボス部屋
fill 820 75 -13 862 75 13 minecraft:polished_deepslate
fill 819 76 -14 863 90 -14 minecraft:deepslate_tiles
fill 819 76 14 863 90 14 minecraft:deepslate_tiles
fill 819 76 -14 819 90 14 minecraft:deepslate_tiles
fill 863 76 -14 863 90 14 minecraft:deepslate_tiles
fill 819 76 -1 819 78 1 minecraft:air
execute positioned 825 76 -10 run function hook:gimmick/press/place
execute positioned 836 76 -10 run function hook:gimmick/press/place
execute positioned 847 76 -10 run function hook:gimmick/press/place
execute positioned 858 76 -10 run function hook:gimmick/press/place
execute positioned 825 76 10 run function hook:gimmick/press/place
execute positioned 836 76 10 run function hook:gimmick/press/place
execute positioned 847 76 10 run function hook:gimmick/press/place
execute positioned 858 76 10 run function hook:gimmick/press/place
