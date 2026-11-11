#> hook:boss/2/reward
# @s = 番人を倒したプレイヤー
scoreboard players set @s hook.ability 2
title @s title {text:"機巧の番人 撃破",color:"gold"}
title @s subtitle {text:"能力「スタンチェイン」を得た",color:"aqua"}
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
tellraw @s [{text:"[声] ",color:"aqua"},{text:"ありがとう。番人の核から鎖の力がお前に移った。",color:"white"}]
tellraw @s [{text:"能力「スタンチェイン」",color:"aqua",bold:true},{text:": フックを当てた敵は3秒間動けなくなる。足止めしてから突き飛ばせ。",color:"white",bold:false}]
kill @e[tag=hook.s2]
function hook:stage/3/start
