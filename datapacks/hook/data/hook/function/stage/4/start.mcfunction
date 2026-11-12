#> hook:stage/4/start
# @s = プレイヤー。虚の玉座の前室へ。何度呼んでもよい(ボス戦を待機に戻し、闘技場は tick が建て直す)
scoreboard players set @s hook.stage 4
# 能力2 まで(ステージ2で得ているはず。ここから直接始めた時のため)
scoreboard players set @s hook.ability 2
scoreboard players set @s hook.b3d 0
execute in hook:world run forceload add 1496 -32 1599 31
execute in hook:world run function hook:boss/3/reset
# ステージ4(ボス戦)の集計はここから。結果はエンディングで出す(hook:stage/5/results)
function hook:score/start
function hook:cp/set {id:40,x:1502.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
title @s times 10 60 20
title @s title {text:"虚の玉座",color:"dark_purple"}
title @s subtitle {text:"太陽石の欠片 2/3",color:"gold"}
tellraw @s {text:"最後の欠片は、虚の王が持っている。",color:"gray",italic:true}
tellraw @s {text:"ヒント: トゲ、プレス、奈落。覚えた技をすべて使おう。",color:"gray"}
