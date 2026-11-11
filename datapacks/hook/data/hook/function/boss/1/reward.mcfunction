#> hook:boss/1/reward
# @s = ボス1を倒したプレイヤー。能力1「ヘビーインパクト」を与えてステージ2へ
execute unless score @s hook.ability matches 1.. run scoreboard players set @s hook.ability 1
title @s title {text:"水晶の巨兵 撃破",color:"gold"}
title @s subtitle {text:"能力「ヘビーインパクト」を得た",color:"light_purple"}
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"やったな。巨兵の欠片がフックに宿った。",color:"white"}]
tellraw @s [{text:"【能力】ヘビーインパクト: ",color:"gold"},{text:"重い敵にフックを当てて飛び込むと、ぶつかった勢いでその敵を進行方向へ突き飛ばす。",color:"white"}]
# 坑道に残った雑魚を片付ける(forceload されたままなので動き続ける)
kill @e[tag=hook.s1]
function hook:stage/2/start
