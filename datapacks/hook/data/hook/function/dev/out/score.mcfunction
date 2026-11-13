#> hook:dev/out/score
# @macro name, obj。スコアをチャットへ(mcrun が拾う)
$tellraw @a ["MCO $(name) $(obj) = ",{score:{name:"$(name)",objective:"$(obj)"}}]
