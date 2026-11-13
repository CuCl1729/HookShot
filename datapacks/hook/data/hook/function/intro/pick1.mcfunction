#> hook:intro/pick1
# 標的「ハード」が撃たれた(hook.switch。@s = marker)
execute unless score #t hook.intro matches 399.. run return run function hook:fairy/say {text:"まだ長老のお話の途中だよ"}
function hook:diff/set {level:1}
function hook:intro/chosen
function hook:fairy/say {text:"ハード！ 体力が少なくて、敵も速いよ。気をつけてね"}
