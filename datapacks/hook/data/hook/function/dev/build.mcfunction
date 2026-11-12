#> hook:dev/build
# 試験場(冪等)。床 y63 / 壁A x1830〜1833 z-3〜3 y64〜69(天面 y70)/ 塔B x1840〜1842 z6〜8 y64〜95(天面 y96)/
# 金G1(1850,75,-6) G2(1862,82,4) G3(1874,76,-4)/ 標的 (1820,66,-10)(撃つと hook:dev/switched)
execute in hook:world unless loaded 1880 63 12 run return run say 試験場が読み込まれていない
execute in hook:world run fill 1800 64 -12 1880 78 12 minecraft:air
execute in hook:world run fill 1800 79 -12 1880 93 12 minecraft:air
execute in hook:world run fill 1800 94 -12 1880 108 12 minecraft:air
execute in hook:world run fill 1800 63 -12 1880 63 12 minecraft:smooth_stone
execute in hook:world run fill 1830 64 -3 1833 69 3 minecraft:stone_bricks
execute in hook:world run fill 1840 64 6 1842 95 8 minecraft:stone_bricks
execute in hook:world run setblock 1850 75 -6 minecraft:gold_block
execute in hook:world run setblock 1862 82 4 minecraft:gold_block
execute in hook:world run setblock 1874 76 -4 minecraft:gold_block
execute in hook:world run setblock 1820 66 -10 minecraft:target
execute in hook:world run kill @e[type=marker,tag=hook.switch,x=1820.5,y=66.5,z=-9.5,distance=..1]
execute in hook:world run summon marker 1820.5 66.5 -9.5 {Tags:["hook.switch"],data:{f:"hook:dev/switched"}}
