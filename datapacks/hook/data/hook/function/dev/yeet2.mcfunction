#> hook:dev/yeet2
# 試験用(dev/yeet から)。プレイヤーを storage hook: dev.yaw の向き・やや上へ向け、5 tick 後に右クリック(掴んでいれば投げる)
execute as @a[limit=1] run function hook:dev/yeet_rot with storage hook: dev
schedule function hook:dev/fire_s 5t
