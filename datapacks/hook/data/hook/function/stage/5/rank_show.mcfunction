#> hook:stage/5/rank_show
# @macro n = ステージ名 / r = ランク / c = 色 / pts = 点
$tellraw @a[scores={hook.stage=5}] [{text:"  $(n)  ",color:"gray"},{text:"$(r)",color:"$(c)",bold:true},{text:"  ($(pts) 点)",color:"dark_gray"}]
