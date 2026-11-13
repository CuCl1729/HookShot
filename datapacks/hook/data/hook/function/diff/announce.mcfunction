#> hook:diff/announce
# @macro name/c = 難易度の名前と色(storage hook: diff)
$tellraw @a [{text:"難易度: ",color:"gray"},{text:"$(name)",color:"$(c)",bold:true}]
execute as @a at @s run playsound minecraft:block.note_block.chime master @s ~ ~ ~ 1 1.2
