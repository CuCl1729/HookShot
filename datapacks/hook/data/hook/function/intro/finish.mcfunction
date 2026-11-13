#> hook:intro/finish
# @s = 扉をくぐったプレイヤー。難易度を決めて訓練場へ(stage/0/start が tp・cp・title を行う)
function hook:fairy/say {text:"いこう！ まずは長老の訓練場だよ"}
function hook:stage/0/start
function hook:guide/set {text:"長老のもとで鉤の使い方を学ぶ",x:-24.5,y:64,z:2.5}
