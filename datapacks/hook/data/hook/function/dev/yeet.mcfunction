#> hook:dev/yeet
# 試験用。@s = プレイヤー。いちばん近い軽い敵を掴み(実フック)、30 tick 後に storage hook: dev.yaw の向き(水平)へ投げる(dev/yeet2)
tag @e[tag=dev.z] remove dev.z
tag @n[tag=hook.enemy,tag=!hook.heavy,tag=!hook.boss,distance=..38] add dev.z
function hook:dev/aim_at {tag:"dev.z"}
schedule function hook:dev/yeet2 30t
