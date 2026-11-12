#> hook:stage/1/build_all
# in hook:world から(stage/1/build。範囲は消してある)。生成: gen1.js。床の上面: 入口・大空洞・竪坑 y 50 / 広間・選鉱場・闘技場 y 70 / 通路・前室 y 96
# 大空洞(ハブ)x 211〜249 z ±19 y 51〜111 → 南: 竪坑 A(垂直登攀)/ 北中段: 広間 B(ウェーブ)/ 東中段: 選鉱場 C(投げパズル)/ 東上段: 門 → 通路 → 前室 → 闘技場

# 入口のトンネル x 200〜209(始まり 202.5)
fill 199 49 -3 210 56 3 minecraft:deepslate_bricks
fill 200 51 -2 210 55 2 minecraft:air
fill 199 50 -2 209 50 2 minecraft:deepslate_tiles

# 大空洞
fill 210 50 -20 250 50 20 minecraft:deepslate_tiles
fill 210 112 -20 250 112 20 minecraft:deepslate_bricks
fill 210 50 -20 210 112 20 minecraft:deepslate_bricks
fill 250 50 -20 250 112 20 minecraft:deepslate_bricks
fill 210 50 -20 250 112 -20 minecraft:deepslate_bricks
fill 210 50 20 250 112 20 minecraft:deepslate_bricks
fill 210 51 -2 210 55 2 minecraft:air
fill 226 51 -20 234 57 -20 minecraft:air
fill 226 71 20 234 76 20 minecraft:air
fill 250 71 6 250 76 14 minecraft:air
fill 250 97 -3 250 102 3 minecraft:air
# 中央の柱(上面 y 80。門・中段の口へはここから)
fill 228 51 -2 232 80 2 minecraft:polished_deepslate
fill 228 80 -2 232 80 2 minecraft:amethyst_block
# 床のトゲ(掴んで上で放す)
fill 217 50 -11 221 50 -7 minecraft:amethyst_block
fill 217 51 -11 221 51 -7 minecraft:amethyst_cluster
fill 239 50 7 243 50 11 minecraft:amethyst_block
fill 239 51 7 243 51 11 minecraft:amethyst_cluster
fill 217 50 7 221 50 11 minecraft:amethyst_block
fill 217 51 7 221 51 11 minecraft:amethyst_cluster
# 光の粒1: 北西の高い棚(柱の上から)
fill 211 97 15 215 99 19 minecraft:cobbled_deepslate
summon item_display 213.5 100.3 17.5 {Tags:["hook.lore","hook.s1","hook.s1lore"],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,item:{id:"minecraft:glowstone_dust",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.8f,0.8f,0.8f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
# 飾りと明かり
fill 211 60 -19 211 66 -15 minecraft:budding_amethyst
fill 249 85 15 249 92 19 minecraft:budding_amethyst

# 竪坑 A(垂直登攀)x 222〜238 z -40〜-21。底はトゲ(敵を落とすと倒れる)。張り出し L1〜L4 を交互に登り、L4 に水晶鍵
fill 221 50 -41 239 50 -20 minecraft:deepslate_tiles
fill 221 112 -41 239 112 -20 minecraft:deepslate_bricks
fill 221 50 -41 221 112 -20 minecraft:deepslate_bricks
fill 239 50 -41 239 112 -20 minecraft:deepslate_bricks
fill 221 50 -41 239 112 -41 minecraft:deepslate_bricks
fill 221 50 -20 239 112 -20 minecraft:deepslate_bricks
fill 226 51 -20 234 57 -20 minecraft:air
fill 222 50 -40 238 50 -26 minecraft:amethyst_block
fill 222 51 -40 238 51 -26 minecraft:amethyst_cluster
fill 222 60 -34 226 62 -30 minecraft:cobbled_deepslate
fill 234 72 -40 238 74 -36 minecraft:cobbled_deepslate
fill 222 84 -40 226 86 -36 minecraft:cobbled_deepslate
fill 233 96 -30 238 98 -25 minecraft:cobbled_deepslate
fill 222 106 -24 225 108 -21 minecraft:cobbled_deepslate
summon item_display 235.5 99.5 -27.5 {Tags:["hook.s1","hook.s1key"],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,item:{id:"minecraft:amethyst_shard",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.2f,1.2f,1.2f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
summon item_display 223.5 109.3 -22.5 {Tags:["hook.lore","hook.s1","hook.s1lore"],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,item:{id:"minecraft:glowstone_dust",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.8f,0.8f,0.8f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
fill 238 60 -40 238 66 -37 minecraft:budding_amethyst

# 広間 B(ウェーブ)。通路 z 21〜27 → 広間 x 212〜248 z 29〜61 床 y 70。入ると格子(z 28)が閉じ、3波を倒すと開いて柱の上に鍵
fill 225 69 21 235 77 27 minecraft:deepslate_bricks
fill 226 71 21 234 76 27 minecraft:air
fill 226 70 21 234 70 27 minecraft:deepslate_tiles
fill 211 70 28 249 70 62 minecraft:deepslate_tiles
fill 211 93 28 249 93 62 minecraft:deepslate_bricks
fill 211 70 28 211 93 62 minecraft:deepslate_bricks
fill 249 70 28 249 93 62 minecraft:deepslate_bricks
fill 211 70 28 249 93 28 minecraft:deepslate_bricks
fill 211 70 62 249 93 62 minecraft:deepslate_bricks
fill 226 71 28 234 76 28 minecraft:air
fill 218 70 36 222 70 40 minecraft:amethyst_block
fill 218 71 36 222 71 40 minecraft:amethyst_cluster
fill 238 70 36 242 70 40 minecraft:amethyst_block
fill 238 71 36 242 71 40 minecraft:amethyst_cluster
fill 218 70 52 222 70 56 minecraft:amethyst_block
fill 218 71 52 222 71 56 minecraft:amethyst_cluster
fill 238 70 52 242 70 56 minecraft:amethyst_block
fill 238 71 52 242 71 56 minecraft:amethyst_cluster
fill 229 71 44 231 82 46 minecraft:polished_deepslate
fill 212 78 43 214 80 47 minecraft:cobbled_deepslate
fill 246 78 43 248 80 47 minecraft:cobbled_deepslate
fill 211 75 55 211 82 60 minecraft:budding_amethyst

# 選鉱場 C(投げパズル)。通路 x 251〜257 → 部屋 x 259〜297 z -6〜26 床 y 70 天井 y 95。的3つに敵を投げ当てると檻が開く
fill 251 69 5 258 77 15 minecraft:deepslate_bricks
fill 250 71 6 258 76 14 minecraft:air
fill 251 70 6 257 70 14 minecraft:deepslate_tiles
fill 258 70 -7 298 70 27 minecraft:deepslate_tiles
fill 258 95 -7 298 95 27 minecraft:deepslate_bricks
fill 258 70 -7 258 95 27 minecraft:deepslate_bricks
fill 298 70 -7 298 95 27 minecraft:deepslate_bricks
fill 258 70 -7 298 95 -7 minecraft:deepslate_bricks
fill 258 70 27 298 95 27 minecraft:deepslate_bricks
fill 258 71 6 258 76 14 minecraft:air
# 的1: 北の壁(前にトゲの堀)
fill 264 70 22 274 70 26 minecraft:amethyst_block
fill 264 71 22 274 71 26 minecraft:amethyst_cluster
fill 268 73 27 270 75 27 minecraft:target
summon marker 268.5 73.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 268.5 74.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 268.5 75.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 269.5 73.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 269.5 74.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 269.5 75.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 270.5 73.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 270.5 74.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
summon marker 270.5 75.5 27.5 {Tags:["hook.switch","hook.s1","hook.s1t1"],data:{f:"hook:stage/1/c/t1"}}
# 的2: 天井
fill 278 95 0 280 95 2 minecraft:target
summon marker 278.5 95.5 0.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 278.5 95.5 1.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 278.5 95.5 2.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 279.5 95.5 0.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 279.5 95.5 1.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 279.5 95.5 2.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 280.5 95.5 0.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 280.5 95.5 1.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
summon marker 280.5 95.5 2.5 {Tags:["hook.switch","hook.s1","hook.s1t2"],data:{f:"hook:stage/1/c/t2"}}
fill 276 70 -2 282 70 4 minecraft:amethyst_block
fill 276 71 -2 282 71 4 minecraft:amethyst_cluster
# 的3: 東の壁の窪み(前に重装兵が立つ。先に何かを投げ当てて倒す)
fill 292 71 16 297 77 16 minecraft:deepslate_bricks
fill 292 71 22 297 77 22 minecraft:deepslate_bricks
fill 292 77 16 297 77 22 minecraft:deepslate_bricks
fill 298 72 18 298 74 20 minecraft:target
summon marker 298.5 72.5 18.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 72.5 19.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 72.5 20.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 73.5 18.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 73.5 19.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 73.5 20.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 74.5 18.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 74.5 19.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
summon marker 298.5 74.5 20.5 {Tags:["hook.switch","hook.s1","hook.s1t3"],data:{f:"hook:stage/1/c/t3"}}
# 鍵の檻(的3つで開く)
fill 292 71 8 296 75 12 minecraft:iron_bars hollow
fill 292 70 8 296 70 12 minecraft:amethyst_block
# (鍵は檻が開いてから c/done が出す。格子は薄く、押し付けると檻の外からでも 2.5 以内に入るため)
# 光の粒3: 南西の高い棚
fill 259 88 -6 262 90 -3 minecraft:cobbled_deepslate
summon item_display 260.5 91.3 -4.5 {Tags:["hook.lore","hook.s1","hook.s1lore"],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,item:{id:"minecraft:glowstone_dust",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.8f,0.8f,0.8f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}

# 門(大空洞の東上段。水晶鍵3つで格子が消える)と通路 x 251〜299、前室 x 300〜309(床 y 96)
fill 251 96 -4 309 103 4 minecraft:deepslate_bricks
fill 251 97 -3 309 102 3 minecraft:air
fill 251 96 -3 309 96 3 minecraft:deepslate_tiles
fill 252 97 -3 252 102 3 minecraft:iron_bars
fill 300 96 -3 309 96 3 minecraft:polished_deepslate

# 闘技場 x 311〜359 z ±20 床 y 70 天井 y 104。前室から西の口(x 310, y 97〜102)で降りる。トゲの島の上のトゲは boss/1/reset が置き直す
fill 310 70 -21 360 70 21 minecraft:polished_deepslate
fill 310 104 -21 360 104 21 minecraft:deepslate_bricks
fill 310 70 -21 310 104 21 minecraft:deepslate_bricks
fill 360 70 -21 360 104 21 minecraft:deepslate_bricks
fill 310 70 -21 360 104 -21 minecraft:deepslate_bricks
fill 310 70 21 360 104 21 minecraft:deepslate_bricks
fill 310 97 -3 310 102 3 minecraft:air
fill 314 71 -18 316 86 -16 minecraft:polished_deepslate
fill 314 71 16 316 86 18 minecraft:polished_deepslate
fill 354 71 -18 356 86 -16 minecraft:polished_deepslate
fill 354 71 16 356 86 18 minecraft:polished_deepslate
fill 321 70 -9 323 70 -7 minecraft:amethyst_block
fill 321 70 7 323 70 9 minecraft:amethyst_block
fill 347 70 -9 349 70 -7 minecraft:amethyst_block
fill 347 70 7 349 70 9 minecraft:amethyst_block
fill 334 70 -1 336 70 1 minecraft:amethyst_block
fill 360 80 -6 360 92 6 minecraft:budding_amethyst

# 明かり(最後に。空気だけを置き換える)
fill 200 54 -2 209 54 2 minecraft:light[level=15] replace minecraft:air
fill 211 58 -19 249 58 19 minecraft:light[level=15] replace minecraft:air
fill 211 70 -19 249 70 19 minecraft:light[level=15] replace minecraft:air
fill 211 82 -19 249 82 19 minecraft:light[level=15] replace minecraft:air
fill 211 94 -19 249 94 19 minecraft:light[level=15] replace minecraft:air
fill 211 106 -19 249 106 19 minecraft:light[level=15] replace minecraft:air
fill 222 58 -40 238 58 -21 minecraft:light[level=15] replace minecraft:air
fill 222 70 -40 238 70 -21 minecraft:light[level=15] replace minecraft:air
fill 222 82 -40 238 82 -21 minecraft:light[level=15] replace minecraft:air
fill 222 94 -40 238 94 -21 minecraft:light[level=15] replace minecraft:air
fill 222 106 -40 238 106 -21 minecraft:light[level=15] replace minecraft:air
fill 212 76 21 248 76 61 minecraft:light[level=15] replace minecraft:air
fill 212 88 21 248 88 61 minecraft:light[level=15] replace minecraft:air
fill 251 76 -6 297 76 26 minecraft:light[level=15] replace minecraft:air
fill 251 88 -6 297 88 26 minecraft:light[level=15] replace minecraft:air
fill 251 100 -3 309 100 3 minecraft:light[level=15] replace minecraft:air
fill 311 76 -20 359 76 20 minecraft:light[level=15] replace minecraft:air
fill 311 88 -20 359 88 20 minecraft:light[level=15] replace minecraft:air
fill 311 100 -20 359 100 20 minecraft:light[level=15] replace minecraft:air
