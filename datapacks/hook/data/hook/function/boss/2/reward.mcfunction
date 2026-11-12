#> hook:boss/2/reward
# @s = 番人を倒したプレイヤー
scoreboard players set @s hook.ability 2
title @s times 10 60 15
title @s title {text:"太陽石の欠片 2/3",color:"gold"}
title @s subtitle {text:"能力「スタンチェイン」を得た",color:"aqua"}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
tellraw @s {text:"番人が止まり、胸から欠片がこぼれた。欠片の光で鉤が強くなる。太陽石の欠片 2/3。",color:"gray",italic:true}
tellraw @s {text:"最後のひとつは空の上、虚の王が持っている。",color:"gray",italic:true}
tellraw @s [{text:"能力「スタンチェイン」",color:"aqua",bold:true},{text:": フックを当てた敵は3秒間動けなくなる。足止めしてから突き飛ばせ。",color:"white",bold:false}]
