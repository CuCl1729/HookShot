#> hook:stage/0/build_all
# in hook:world から(stage/0/build。範囲は消してある)。床の上面は y=64 が基本。下は奈落(落ちたらチェックポイントへ)
# 第1列(z -8〜8、+x へ): A 始まりの台 → B 壁(上端を撃って天面へ) → 金ブロック3つ(連続) → C 塔 → 幕の下を落ちながら D 台へ(フロート)
# 第2列(z 14〜44、-x へ): 庭 Z4 投げ→標的 / 壁 x70 / Z5 敵を敵へ / 壁 x50 / Z6 爆弾兵 / 壁 x31 / 谷 / 島 Z7 重装兵・Z8 トゲ

# A 始まりの台
fill -30 63 -5 -20 63 5 minecraft:stone_bricks
# B 壁: 高さ6・厚さ5(A の端から 14)
fill -6 63 -5 -2 69 5 minecraft:stone_bricks
# 連続: 浮いた金ブロック(12 間隔、少しずつ高く)
fill 9 69 -1 11 71 1 minecraft:gold_block
fill 23 71 -1 25 73 1 minecraft:gold_block
fill 37 73 -1 39 75 1 minecraft:gold_block
# C 塔(上面 y=82)
fill 49 63 -5 57 81 5 minecraft:stone_bricks
# 幕: C の上からは D 台が隠れて見えない。y 73 あたりまで落ちると幕の下に D 台の縁が見える
fill 62 72 -8 62 95 8 minecraft:deepslate_bricks
# D 台(上面 y=68)と、庭へ続く床
fill 74 63 -5 94 63 13 minecraft:polished_andesite
fill 74 64 -4 78 67 4 minecraft:stone_bricks
fill 74 64 -6 94 65 -6 minecraft:stone_bricks

# 庭(x 31〜94, z 14〜44)と縁の低い壁
fill 31 63 14 94 63 44 minecraft:polished_andesite
fill 31 64 45 94 65 45 minecraft:stone_bricks
fill 95 64 -6 95 65 45 minecraft:stone_bricks
fill 31 64 13 73 65 13 minecraft:stone_bricks
# 仕切りの壁(高さ27)。扉は段階が進むと開く(stage/0/s5〜s7)
fill 70 64 14 70 90 44 minecraft:stone_bricks
fill 50 64 14 50 90 44 minecraft:stone_bricks
fill 31 64 14 31 90 44 minecraft:stone_bricks
# Z4 の標的(壁 x70 の 3x3)。投げ当てると stage/0/t1
fill 70 65 22 70 67 24 minecraft:target
summon marker 70.5 65.5 22.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 65.5 23.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 65.5 24.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 66.5 22.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 66.5 23.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 66.5 24.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 67.5 22.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 67.5 23.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
summon marker 70.5 67.5 24.5 {Tags:["hook.switch","hook.tut"],data:{f:"hook:stage/0/t1"}}
# 的の台(敵の立ち位置の目印。敵は stage/0/tick がこの上に留める)
fill 87 63 35 89 63 37 minecraft:chiseled_stone_bricks
fill 56 63 28 61 63 30 minecraft:chiseled_stone_bricks
fill 45 63 39 47 63 41 minecraft:red_terracotta
fill 35 63 17 39 63 22 minecraft:chiseled_stone_bricks

# 島(x -24〜11)。谷 x 12〜30 は奈落
fill -24 63 14 11 63 44 minecraft:polished_andesite
fill -25 64 13 11 65 13 minecraft:stone_bricks
fill -25 64 45 11 65 45 minecraft:stone_bricks
fill -25 64 14 -25 65 44 minecraft:stone_bricks
fill 4 63 28 6 63 30 minecraft:iron_block
# Z8 トゲ: 全幅の帯。奥のゾンビ2体は的(stage/0/dummy で足止め・台へ戻す)。掴んで帯の上で放すか、帯へ投げると死ぬ
# (引き寄せ中はトゲの判定が無く、トゲはフック・投げにとって壁なので「引くだけ」では死なない)
fill -16 63 14 -3 63 44 minecraft:amethyst_block
fill -16 64 14 -3 64 44 minecraft:amethyst_cluster

# 西の門(訓練修了で格子が消える。くぐると水晶坑道へ)
fill -30 63 26 -26 63 32 minecraft:polished_andesite
fill -25 64 26 -25 70 26 minecraft:polished_blackstone_bricks
fill -25 64 32 -25 70 32 minecraft:polished_blackstone_bricks
fill -25 70 27 -25 70 31 minecraft:polished_blackstone_bricks
fill -25 64 27 -25 69 31 minecraft:iron_bars
fill -30 64 26 -30 69 32 minecraft:black_concrete

execute unless entity @e[tag=hook.npc] positioned -24.5 64 2.5 run function hook:npc/summon
