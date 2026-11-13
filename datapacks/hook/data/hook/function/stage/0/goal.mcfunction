#> hook:stage/0/goal
# @s = プレイヤー。いまの段階(hook.tut)から「いまの目的」と行き先を出す(hook:guide/set)。各段階の始まり(s2〜s8・finish・bell・guide)から
execute if score @s hook.tut matches 1 unless entity @s[tag=hook.t0bell] run return run function hook:guide/set {text:"9番の鈴でルミに聞く",x:-4,y:70,z:0}
execute if score @s hook.tut matches 1 run return run function hook:guide/set {text:"石の壁の上に乗る",x:-4,y:70,z:0}
execute if score @s hook.tut matches 2 run return run function hook:guide/set {text:"金の足場を渡り塔の上へ",x:53,y:82,z:0}
execute if score @s hook.tut matches 3 run return run function hook:guide/set {text:"飛び降り幕の下の台へ",x:76,y:68,z:0}
execute if score @s hook.tut matches 4 run return run function hook:guide/set {text:"ゾンビを壁の的へ投げる",x:70,y:66,z:23}
execute if score @s hook.tut matches 5 run return run function hook:guide/set {text:"ゾンビをゾンビへ投げる",x:59,y:64,z:29}
execute if score @s hook.tut matches 6 run return run function hook:guide/set {text:"爆弾兵をゾンビへ投げる",x:38,y:64,z:20}
execute if score @s hook.tut matches 7 run return run function hook:guide/set {text:"島の重装兵へ飛び移る",x:5,y:64,z:29}
execute if score @s hook.tut matches 8 run return run function hook:guide/set {text:"ゾンビをトゲへ放り込む",x:-21,y:64,z:29}
execute if score @s hook.tut matches 9 run function hook:guide/set {text:"西の門をくぐる",x:-27,y:64,z:29}
