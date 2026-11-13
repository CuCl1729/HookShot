#> hook:dev/refire
# 試験用。@s = プレイヤー。@macro x/y/z = 狙う点(y は目の高さ分 1.62 下げる)。向きだけ変えて(rotate は速度に触らない)撃つ = 引き寄せ中の撃ち直し
$rotate @s facing $(x) $(y) $(z)
execute at @s run function hook:hook/fire