#> hook:stage/3/build
# 天空回廊(hook:world, x 1000〜1236, z -8〜8, 足場 y 64〜98)。冪等。start が forceload したチャンクが読み込まれるまでは何もしない
# 区画 0 出発の島 S0 / 1 浮島渡り I1〜I4 / 2 体当たり B・W / 3 横の足場 I5・P・C / 4 クモ D・E / 5 塔 T1〜T3 / 6 最後の回廊 F・S → 門の島 G
# 必須の飛び移りはすべて距離 13 以下(射程24)。フック柱は手前の縁から3マス内側(引っ張りは錨の約2マス手前で止まるため)
execute in hook:world unless loaded 1000 63 -8 run return 0
execute in hook:world unless loaded 1000 63 8 run return 0
execute in hook:world unless loaded 1080 63 -8 run return 0
execute in hook:world unless loaded 1080 63 8 run return 0
execute in hook:world unless loaded 1160 63 -8 run return 0
execute in hook:world unless loaded 1160 63 8 run return 0
execute in hook:world unless loaded 1236 63 -8 run return 0
execute in hook:world unless loaded 1236 63 8 run return 0
# S0
execute in hook:world run fill 1000 63 -5 1011 63 5 minecraft:smooth_quartz
execute in hook:world run fill 1001 62 -4 1010 62 4 minecraft:calcite
# I1(open1 まで無い)
execute in hook:world run fill 1018 62 -3 1025 68 3 minecraft:air
# I2
execute in hook:world run fill 1031 67 -2 1037 67 2 minecraft:smooth_quartz
execute in hook:world run fill 1032 66 -1 1036 66 1 minecraft:calcite
execute in hook:world run fill 1034 68 0 1034 71 0 minecraft:quartz_pillar
execute in hook:world run fill 1034 72 0 1034 72 0 minecraft:sea_lantern
# I3
execute in hook:world run fill 1043 65 3 1049 65 8 minecraft:smooth_quartz
execute in hook:world run fill 1044 64 4 1048 64 7 minecraft:calcite
execute in hook:world run fill 1046 66 5 1046 69 5 minecraft:quartz_pillar
execute in hook:world run fill 1046 70 5 1046 70 5 minecraft:sea_lantern
# I4
execute in hook:world run fill 1055 69 -3 1063 69 3 minecraft:smooth_quartz
execute in hook:world run fill 1056 68 -2 1062 68 2 minecraft:calcite
execute in hook:world run fill 1058 70 0 1058 73 0 minecraft:quartz_pillar
execute in hook:world run fill 1058 74 0 1058 74 0 minecraft:sea_lantern
# B
execute in hook:world run fill 1070 71 -4 1082 71 4 minecraft:smooth_quartz
execute in hook:world run fill 1071 70 -3 1081 70 3 minecraft:calcite
execute in hook:world run fill 1073 72 0 1073 75 0 minecraft:quartz_pillar
execute in hook:world run fill 1073 76 0 1073 76 0 minecraft:sea_lantern
# W
execute in hook:world run fill 1084 71 -4 1086 71 4 minecraft:smooth_quartz
execute in hook:world run fill 1085 70 -3 1085 70 3 minecraft:calcite
# I5(open2 まで無い)
execute in hook:world run fill 1092 72 -2 1098 78 2 minecraft:air
# P
execute in hook:world run fill 1104 73 -8 1120 73 -4 minecraft:smooth_quartz
execute in hook:world run fill 1105 72 -7 1119 72 -5 minecraft:calcite
execute in hook:world run fill 1107 74 -6 1107 77 -6 minecraft:quartz_pillar
execute in hook:world run fill 1107 78 -6 1107 78 -6 minecraft:sea_lantern
# C
execute in hook:world run fill 1104 73 -2 1126 73 0 minecraft:smooth_quartz
execute in hook:world run fill 1105 72 -1 1125 72 -1 minecraft:calcite
# D
execute in hook:world run fill 1132 75 -4 1140 75 4 minecraft:smooth_quartz
execute in hook:world run fill 1133 74 -3 1139 74 3 minecraft:calcite
execute in hook:world run fill 1135 76 0 1135 79 0 minecraft:quartz_pillar
execute in hook:world run fill 1135 80 0 1135 80 0 minecraft:sea_lantern
# E
execute in hook:world run fill 1150 79 -4 1158 79 4 minecraft:smooth_quartz
execute in hook:world run fill 1151 78 -3 1157 78 3 minecraft:calcite
execute in hook:world run fill 1153 80 0 1153 83 0 minecraft:quartz_pillar
execute in hook:world run fill 1153 84 0 1153 84 0 minecraft:sea_lantern
# T1
execute in hook:world run fill 1164 85 -2 1168 85 2 minecraft:smooth_quartz
execute in hook:world run fill 1165 84 -1 1167 84 1 minecraft:calcite
execute in hook:world run fill 1167 86 0 1167 89 0 minecraft:quartz_pillar
execute in hook:world run fill 1167 90 0 1167 90 0 minecraft:sea_lantern
# T2
execute in hook:world run fill 1172 91 4 1176 91 8 minecraft:smooth_quartz
execute in hook:world run fill 1173 90 5 1175 90 7 minecraft:calcite
execute in hook:world run fill 1175 92 6 1175 95 6 minecraft:quartz_pillar
execute in hook:world run fill 1175 96 6 1175 96 6 minecraft:sea_lantern
# T3
execute in hook:world run fill 1180 97 -4 1184 97 0 minecraft:smooth_quartz
execute in hook:world run fill 1181 96 -3 1183 96 -1 minecraft:calcite
execute in hook:world run fill 1183 98 -2 1183 101 -2 minecraft:quartz_pillar
execute in hook:world run fill 1183 102 -2 1183 102 -2 minecraft:sea_lantern
# F
execute in hook:world run fill 1190 97 -2 1214 97 2 minecraft:smooth_quartz
execute in hook:world run fill 1191 96 -1 1213 96 1 minecraft:calcite
# S
execute in hook:world run fill 1196 97 4 1204 97 8 minecraft:smooth_quartz
execute in hook:world run fill 1197 96 5 1203 96 7 minecraft:calcite
# G
execute in hook:world run fill 1222 97 -5 1236 97 5 minecraft:smooth_quartz
execute in hook:world run fill 1223 96 -4 1235 96 4 minecraft:calcite
# G の門(泣く黒曜石のアーチ)
execute in hook:world run fill 1230 98 -2 1230 103 2 minecraft:crying_obsidian
execute in hook:world run fill 1230 98 -1 1230 102 1 minecraft:air
data modify storage hook: built.s3 set value 1b
