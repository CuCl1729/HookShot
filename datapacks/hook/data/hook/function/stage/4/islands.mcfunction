#> hook:stage/4/islands
# hook:world で実行。第2形態で残る浮島(床 y 63)。第1形態でも床の上に色違いで見えている(崩れる場所の予告)
# E 入口 / C 玉座の島(王の戻り先 1550 64 0) / S1・S2 トゲ / P1・P2 プレス / T 玉座。島どうしは斜めでも 3 以上離す(王が歩いて渡れない)、飛び移りは 13 以下
fill 1516 63 -3 1521 63 3 minecraft:deepslate_tiles
fill 1545 63 -5 1555 63 5 minecraft:deepslate_tiles
setblock 1545 63 -5 minecraft:sea_lantern
setblock 1555 63 -5 minecraft:sea_lantern
setblock 1545 63 5 minecraft:sea_lantern
setblock 1555 63 5 minecraft:sea_lantern
# S1 / S2(トゲ 5x5)
fill 1524 63 -14 1532 63 -6 minecraft:deepslate_tiles
fill 1526 63 -12 1530 63 -8 minecraft:amethyst_block
fill 1526 64 -12 1530 64 -8 minecraft:amethyst_cluster
fill 1568 63 6 1576 63 14 minecraft:deepslate_tiles
fill 1570 63 8 1574 63 12 minecraft:amethyst_block
fill 1570 64 8 1574 64 12 minecraft:amethyst_cluster
# P1 / P2(プレスの範囲は 1535〜1539, z 9〜13 と 1561〜1565, z -13〜-9)
fill 1532 63 7 1541 63 15 minecraft:deepslate_tiles
fill 1559 63 -15 1568 63 -7 minecraft:deepslate_tiles
# フック柱(引っ張りは錨の約2マス手前で止まるので、着く側の縁から3マス以上内側。1550 0 は王の戻り先なので空ける。上端は崩落の消去範囲 y 68 まで)
fill 1517 64 2 1517 67 2 minecraft:crying_obsidian
fill 1548 64 2 1548 67 2 minecraft:crying_obsidian
fill 1552 64 -2 1552 67 -2 minecraft:crying_obsidian
fill 1528 64 -10 1528 67 -10 minecraft:crying_obsidian
fill 1572 64 10 1572 67 10 minecraft:crying_obsidian
# T 玉座
fill 1579 63 -3 1584 63 3 minecraft:deepslate_tiles
fill 1584 64 -2 1584 67 2 minecraft:crying_obsidian
setblock 1583 64 0 minecraft:polished_blackstone_stairs[facing=east]
