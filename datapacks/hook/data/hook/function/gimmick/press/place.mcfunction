#> hook:gimmick/press/place
# プレス機を実行位置に設置(冪等。設置し直すと上がった状態に戻る)。実行位置 = 押し潰す範囲の床の上のブロック(align xyz する)。
# 範囲 = 実行位置を中心に 5x5、高さ 5(重い敵・scale 2 のボスも入る)。頭(block_display、当たり判定なし)は 6 上、
# 7x7 の筐体は 8 上、標的ブロックは筐体の四隅の下(7 上)。プレス同士は中心を 8 以上離す。
# 毎 tick hook:gimmick/press/tick を(各ステージの tick から)呼ぶこと。プレイヤーには何もしない
scoreboard objectives add hook.press dummy
execute align xyz run function hook:gimmick/press/build
