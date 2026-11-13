#> hook:fx/credits_run
# @macro name/c = 難易度(storage hook: diff)
$tellraw @a [{text:"難易度 ",color:"gray"},{text:"$(name)",color:"$(c)",bold:true},{text:"  倒れた回数 ",color:"gray"},{score:{name:"#deaths",objective:"hook.score"},color:"white"},{text:"  光の粒 ",color:"gray"},{score:{name:"#lore",objective:"hook.score"},color:"yellow"},{text:"/9",color:"gray"}]
