#> hook:stage/2/c/back
# @s = アリーナの外へ出た組立場の敵。搬入口(奥の中央)へ戻す
tp @s 676.5 64 33.5
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
particle minecraft:large_smoke 676.5 66 33.5 0.5 1 0.5 0 15 force @a
