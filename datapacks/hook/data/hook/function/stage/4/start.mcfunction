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
function hook:fx/stage_title {name:"虚の玉座",sub:"太陽石の欠片 2/3"}
tellraw @s {text:"雲の上の玉座。最後の欠片は、虚の王が持っている。",color:"gray",italic:true}
function hook:fairy/say {text:"この先に王がいる……欠片の気配、すごく強いよ"}
function hook:guide/set {text:"門をくぐって玉座の間へ",x:1518.5,y:64,z:0.5}
