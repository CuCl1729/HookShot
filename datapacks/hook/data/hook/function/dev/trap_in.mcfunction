#> hook:dev/trap_in
# 試験用。@macro x/z = プレスの中心(ブロックの角)。tag dev.z の敵が範囲(5x5)にいれば成功
$execute positioned $(x) 63 $(z) if entity @e[tag=dev.z,dx=4,dy=4,dz=4] run return 1
return fail
