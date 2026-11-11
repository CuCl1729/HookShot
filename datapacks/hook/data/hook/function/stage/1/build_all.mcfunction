#> hook:stage/1/build_all
# in hook:world から(hook:stage/1/build)。坑道の内側は z 1〜14、天井 y=77。各 fill は 32768 ブロック以下
# 部屋: R1 入口 200〜239 / R2 トゲの回廊 240〜279 / R3 崩れた足場 280〜319 / R4 蜘蛛の巣 320〜359
#       R5 重装兵の架け橋 360〜409 / R6 水晶の群れ 410〜449 / R7 前室 450〜459 / 闘技場 460〜500
fill 199 52 0 501 77 0 minecraft:deepslate_bricks
fill 199 52 15 501 77 15 minecraft:deepslate_bricks
fill 199 52 1 199 77 14 minecraft:deepslate_bricks
fill 501 52 1 501 77 14 minecraft:deepslate_bricks
fill 200 77 1 500 77 14 minecraft:deepslate_tiles
fill 200 77 7 500 77 8 minecraft:pearlescent_froglight
# 照明(light は #hook:pass なのでフックを遮らない)。R4 だけ暗く(明るさ 12 以上だとクモが襲ってこない)
fill 200 66 7 500 66 8 minecraft:light[level=15]
fill 320 66 7 359 66 8 minecraft:light[level=8]

# R1 入口: 谷 215〜224。柱 x=228 へフックで渡る
fill 200 62 1 214 63 14 minecraft:cobbled_deepslate
fill 225 62 1 279 63 14 minecraft:cobbled_deepslate
fill 228 64 7 228 69 8 minecraft:polished_deepslate
# R2 トゲの回廊: トゲ 250〜259。スケルトンの台 266〜268(上面 y=68)。出口の格子 x=278
fill 250 63 1 259 63 14 minecraft:amethyst_block
fill 250 64 1 259 64 14 minecraft:amethyst_cluster
fill 266 64 6 268 67 9 minecraft:deepslate_tiles
fill 278 64 1 278 76 14 minecraft:iron_bars
# R3 崩れた足場: 足場 292〜297(柱 296)、304〜309(柱 308)、対岸 316〜(柱 319)
fill 280 62 1 286 63 14 minecraft:cobbled_deepslate
fill 292 62 5 297 63 10 minecraft:cobbled_deepslate
fill 296 64 7 296 69 8 minecraft:polished_deepslate
fill 304 62 5 309 63 10 minecraft:cobbled_deepslate
fill 308 64 7 308 69 8 minecraft:polished_deepslate
fill 316 62 1 366 63 14 minecraft:cobbled_deepslate
fill 319 64 7 319 69 8 minecraft:polished_deepslate
# R4 蜘蛛の巣: トゲの堀 336〜345。出口の格子 x=358
fill 336 63 1 345 63 14 minecraft:amethyst_block
fill 336 64 1 345 64 14 minecraft:amethyst_cluster
fill 358 64 1 358 76 14 minecraft:iron_bars
# R5 重装兵の架け橋: 谷 367〜399。重装兵の足場 374〜379、388〜393。対岸 400〜(柱 403)
fill 374 62 5 379 63 10 minecraft:cobbled_deepslate
fill 388 62 5 393 63 10 minecraft:cobbled_deepslate
fill 400 62 1 453 63 14 minecraft:cobbled_deepslate
fill 403 64 7 403 69 8 minecraft:polished_deepslate
# R6 水晶の群れ: トゲの堀 422〜431。スケルトンの台 438〜440(上面 y=68)。出口の格子 x=448
fill 422 63 1 431 63 14 minecraft:amethyst_block
fill 422 64 1 431 64 14 minecraft:amethyst_cluster
fill 438 64 2 440 67 4 minecraft:deepslate_tiles
fill 448 64 1 448 76 14 minecraft:iron_bars
# R7 前室: 谷 454〜459。柱 x=463 へ渡る
fill 460 62 1 500 63 14 minecraft:polished_deepslate
fill 463 64 7 463 69 8 minecraft:chiseled_deepslate
# 闘技場: トゲの島 469〜471(z 10〜14)/ 477〜479(z 1〜5)/ 487〜489(z 10〜14)/ 495〜497(z 1〜5)(上のトゲは boss/1/reset が置き直す)
# 左右互い違いで中央 z 6〜9 は空ける。全幅の帯だと入口で待つだけで巨兵が2本踏んでしまう
fill 469 63 10 471 63 14 minecraft:amethyst_block
fill 477 63 1 479 63 5 minecraft:amethyst_block
fill 487 63 10 489 63 14 minecraft:amethyst_block
fill 495 63 1 497 63 5 minecraft:amethyst_block
function hook:boss/1/reset
# 飾り
fill 230 70 1 236 74 1 minecraft:budding_amethyst
fill 300 68 14 304 73 14 minecraft:budding_amethyst
fill 410 66 1 414 72 1 minecraft:budding_amethyst
fill 480 70 15 486 76 15 minecraft:budding_amethyst
