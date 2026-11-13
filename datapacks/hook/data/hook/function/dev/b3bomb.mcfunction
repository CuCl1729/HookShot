#> hook:dev/b3bomb
# 試験用。@s = プレイヤー。王の手下(爆弾兵があればそれ、無ければ近い手下)を実フックで掴み、35 tick 後に王へ投げる(dev/throw_s)
tag @e[tag=dev.z] remove dev.z
tag @e[tag=dev.y] remove dev.y
tag @e[tag=hook.boss3] add dev.y
tag @n[tag=hook.b3m,tag=hook.bomb] add dev.z
execute unless entity @e[tag=dev.z] run tag @n[tag=hook.b3m] add dev.z
function hook:dev/aim_at {tag:"dev.z"}
schedule function hook:dev/throw_s 35t
