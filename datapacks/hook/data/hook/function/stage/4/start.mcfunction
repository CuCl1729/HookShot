#> hook:stage/4/start
# @s = プレイヤー。虚の玉座の前室へ。何度呼んでもよい(ボス戦を待機に戻し、闘技場は tick が建て直す)
scoreboard players set @s hook.stage 4
# 能力2 まで(ステージ2で得ているはず。ここから直接始めた時のため)
scoreboard players set @s hook.ability 2
scoreboard objectives add hook.b3 dummy
scoreboard objectives add hook.b3d minecraft.custom:minecraft.deaths
scoreboard players set @s hook.b3d 0
execute in hook:world run forceload add 1496 -32 1599 31
execute in hook:world run function hook:boss/3/reset
function hook:cp/set {id:40,x:1502.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
title @s title {text:"虚の玉座",color:"dark_purple"}
title @s subtitle {text:"最後の門",color:"gray"}
tellraw @s {text:"砕けた空の果て、奪われた玉座の間。床の下には、何もない虚が口を開けている。",color:"gray",italic:true}
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"鉄格子の先に虚の王がいる。トゲ、プレス、奈落。これまで覚えた全てを使え。",color:"white"}]
