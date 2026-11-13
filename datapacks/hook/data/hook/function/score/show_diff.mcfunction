#> hook:score/show_diff
# @macro name/c = 難易度(storage hook: diff)。評価に難易度とステージ内の倒れた回数(#sdeaths)を添える(点には入れない)
$tellraw @a [{text:"難易度 ",color:"gray"},{text:"$(name)",color:"$(c)"},{text:"  倒れた回数 ",color:"gray"},{score:{name:"#sdeaths",objective:"hook.score"},color:"white"}]
