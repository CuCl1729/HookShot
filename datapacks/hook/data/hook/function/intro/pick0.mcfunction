#> hook:intro/pick0
# 標的「ノーマル」が撃たれた(hook.switch。@s = marker)
execute unless score #t hook.intro matches 399.. run return run function hook:fairy/say {text:"まだ長老のお話の途中だよ"}
function hook:diff/set {level:0}
function hook:intro/chosen
function hook:fairy/say {text:"ノーマルだね。はじめてなら、これがいちばん！"}
