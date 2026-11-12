#> hook:stage/3/mv/place
# in hook:world。@macro x/y/yh: 板の柱を空にしてから、y〜yh に金の板を置く
$fill $(x) 53 -25 $(x) 94 -23 minecraft:air
$fill $(x) $(y) -25 $(x) $(yh) -23 minecraft:gold_block
