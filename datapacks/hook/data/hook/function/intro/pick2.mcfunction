#> hook:intro/pick2
# 標的「ナイトメア」が撃たれた(hook.switch。@s = marker)
execute unless score #t hook.intro matches 399.. run return run function hook:fairy/say {text:"まだ長老のお話の途中だよ"}
function hook:diff/set {level:2}
function hook:intro/chosen
function hook:fairy/say {text:"ナイトメア……体力6で、倒れたらステージの最初から。本気だね"}
