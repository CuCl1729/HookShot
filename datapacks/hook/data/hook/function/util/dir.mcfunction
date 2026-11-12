#> hook:util/dir
# 実行位置・向きの単位ベクトル(×1000)を #dx #dy #dz hook.temporary に入れる(目印を ^ ^ ^1 へ動かして位置の差を読む)
summon marker ~ ~ ~ {Tags:["hook.dir"]}
execute as @n[type=marker,tag=hook.dir] run function hook:util/dir_m
