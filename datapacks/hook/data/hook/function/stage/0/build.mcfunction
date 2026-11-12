#> hook:stage/0/build
# 訓練場(hook:world, x -32〜95, z -16〜47, y 50〜100)。core の tick が built.s0 が無い間毎 tick 呼ぶ。冪等: 範囲を消してから建てる
# 生成: 読み込み確認と消去は機械的に並べている(チャンクごと / fill は 32768 以下)
execute in hook:world run forceload add -32 -16 95 47
execute in hook:world unless loaded -24 64 -8 run return 0
execute in hook:world unless loaded -24 64 8 run return 0
execute in hook:world unless loaded -24 64 24 run return 0
execute in hook:world unless loaded -24 64 40 run return 0
execute in hook:world unless loaded -8 64 -8 run return 0
execute in hook:world unless loaded -8 64 8 run return 0
execute in hook:world unless loaded -8 64 24 run return 0
execute in hook:world unless loaded -8 64 40 run return 0
execute in hook:world unless loaded 8 64 -8 run return 0
execute in hook:world unless loaded 8 64 8 run return 0
execute in hook:world unless loaded 8 64 24 run return 0
execute in hook:world unless loaded 8 64 40 run return 0
execute in hook:world unless loaded 24 64 -8 run return 0
execute in hook:world unless loaded 24 64 8 run return 0
execute in hook:world unless loaded 24 64 24 run return 0
execute in hook:world unless loaded 24 64 40 run return 0
execute in hook:world unless loaded 40 64 -8 run return 0
execute in hook:world unless loaded 40 64 8 run return 0
execute in hook:world unless loaded 40 64 24 run return 0
execute in hook:world unless loaded 40 64 40 run return 0
execute in hook:world unless loaded 56 64 -8 run return 0
execute in hook:world unless loaded 56 64 8 run return 0
execute in hook:world unless loaded 56 64 24 run return 0
execute in hook:world unless loaded 56 64 40 run return 0
execute in hook:world unless loaded 72 64 -8 run return 0
execute in hook:world unless loaded 72 64 8 run return 0
execute in hook:world unless loaded 72 64 24 run return 0
execute in hook:world unless loaded 72 64 40 run return 0
execute in hook:world unless loaded 88 64 -8 run return 0
execute in hook:world unless loaded 88 64 8 run return 0
execute in hook:world unless loaded 88 64 24 run return 0
execute in hook:world unless loaded 88 64 40 run return 0
# トゲは土台より先に消す(土台ごと消すと欠片が落ちる)
execute in hook:world run fill -32 64 -16 95 64 47 minecraft:air replace minecraft:amethyst_cluster
execute in hook:world run fill -32 50 -16 -23 100 47 minecraft:air
execute in hook:world run fill -22 50 -16 -13 100 47 minecraft:air
execute in hook:world run fill -12 50 -16 -3 100 47 minecraft:air
execute in hook:world run fill -2 50 -16 7 100 47 minecraft:air
execute in hook:world run fill 8 50 -16 17 100 47 minecraft:air
execute in hook:world run fill 18 50 -16 27 100 47 minecraft:air
execute in hook:world run fill 28 50 -16 37 100 47 minecraft:air
execute in hook:world run fill 38 50 -16 47 100 47 minecraft:air
execute in hook:world run fill 48 50 -16 57 100 47 minecraft:air
execute in hook:world run fill 58 50 -16 67 100 47 minecraft:air
execute in hook:world run fill 68 50 -16 77 100 47 minecraft:air
execute in hook:world run fill 78 50 -16 87 100 47 minecraft:air
execute in hook:world run fill 88 50 -16 95 100 47 minecraft:air
execute in hook:world run kill @e[type=item,x=-32,y=40,z=-16,dx=128,dy=70,dz=64]
kill @e[tag=hook.tut]
execute in hook:world run function hook:stage/0/build_all
data modify storage hook: built.s0 set value 1b
