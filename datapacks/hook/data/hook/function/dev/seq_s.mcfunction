#> hook:dev/seq_s
# 試験用(schedule から)。プレイヤーとして hook:dev/seq を呼ぶ(tp の直後に同じ関数内で撃つと、実行位置が tp 前のままになるため)
execute as @a[limit=1] at @s run function hook:dev/seq
