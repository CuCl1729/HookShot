#> hook:stage/5/total
# @macro r = 総合ランク / c = 色
$tellraw @a[scores={hook.stage=5}] [{text:"総合評価  ",color:"gold",bold:true},{text:"$(r)",color:"$(c)",bold:true}]
title @a[scores={hook.stage=5}] times 10 60 20
$title @a[scores={hook.stage=5}] subtitle {text:"総合評価 $(r)",color:"$(c)",bold:true}
title @a[scores={hook.stage=5}] title {text:"戦績",color:"gold"}
