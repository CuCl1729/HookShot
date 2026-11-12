#> hook:stage/3/finish
# @s = 開いた門をくぐったプレイヤー。評価を出し、虚の王への導入のあと(ending)ステージ4へ
scoreboard players set #wave hook.s3 5
scoreboard players set #end hook.s3 1
kill @e[tag=hook.s3]
function hook:score/stop
# 点 = キル×10 + 最大コンボ×20 − 秒。15〜25分の章なので負の閾値(上手い通しで約8分)
function hook:score/show {s:-300,a:-600,b:-900}
tellraw @s {text:"天空回廊 踏破",color:"aqua",bold:true}
