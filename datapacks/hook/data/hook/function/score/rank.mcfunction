#> hook:score/rank
# @macro r = ランク文字 / c = 色
$tellraw @a [{text:"ランク ",color:"gray"},{text:"$(r)",color:"$(c)",bold:true}]
title @a times 10 50 15
$title @a subtitle {text:"ランク $(r)",color:"$(c)",bold:true}
title @a title {text:""}
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1 1
