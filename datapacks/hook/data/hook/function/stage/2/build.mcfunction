#> hook:stage/2/build
# 歯車工場(hook:world, x 600〜863, z ±14, 床の上面 y=64 / 煙突から先は y=76)。冪等。読み込まれるまでは何もしない
# A 入口 x 600〜616 / 谷・柱台 x 625〜629(重装兵)/ R2 プレスの間 x 640〜690(門 x 645, 691)/ 足場 x 692〜696
# R3 ベルトの谷 浮き台 x 705〜709, 718〜722 / R4 鍛造ライン x 731〜775(プレス3基)/ R5 煙突 x 783〜787(y70)
# 前室 x 793〜818(y76)/ ボス部屋 x 820〜862 z ±13(壁 x 819, 863, z ±14、入口 z -1〜1)
execute in hook:world unless loaded 592 63 -16 run return 0
execute in hook:world unless loaded 879 63 15 run return 0
execute in hook:world unless loaded 592 63 15 run return 0
execute in hook:world unless loaded 879 63 -16 run return 0
execute in hook:world run function hook:stage/2/build_blocks
data modify storage hook: built.s2 set value 1b
