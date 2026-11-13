#> hook:dev/wall
# 試験用。@s = プレイヤー。x 1836〜1852・z ±4 を片付け(広く fill するとクライアントが詰まって測定が乱れる)、壁/床板 x 1840〜$(x2)・y $(yb)〜$(ty)・z ±3 を置き、(px, 64, 0.5) へ戻す。
# 撃つ点を storage hook: dev.aim に({x:1840,y:$(ay),z:0.5}。ay は目の高さ分 1.62 下げた値)。撃つのは dev/rep_fire
fill 1836 64 -4 1852 80 4 minecraft:air
$fill 1840 $(yb) -3 $(x2) $(ty) 3 minecraft:stone_bricks
$tp @s $(px) 64 0.5 -90 0
$data modify storage hook: dev.aim set value {x:1840,y:$(ay),z:0.5}