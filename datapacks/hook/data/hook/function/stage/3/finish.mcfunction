#> hook:stage/3/finish
# @s = 門の島 G のアーチをくぐったプレイヤー。回廊の敵を片付けてステージ4へ
kill @e[tag=hook.s3]
title @s title {text:"天空回廊 踏破",color:"gold"}
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"門の向こうは虚の玉座。王を名乗る虚ろなものが、奪った玉座で待っている。",color:"white"}]
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"奴はこれまでの全てで来る。トゲも、プレスも、奈落も。お前も全てで応えろ。",color:"white"}]
function hook:stage/4/start
