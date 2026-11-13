#> hook:intro/finish
# @s = 扉をくぐったプレイヤー。難易度を決めて訓練場へ(stage/0/start が tp・cp・title を行う)
function hook:fairy/say {text:"いこう！ まずは長老の訓練場だよ"}
function hook:stage/0/start
# 最初の目的(9番の鈴でルミに聞く)は、地形が建った後に stage/0/player が出す(ここで guide/set すると順序が前後する)
