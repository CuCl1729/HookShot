#> hook:score/show
# 集計とランクを全員に表示する。@macro s/a/b = ランクの点の下限。点 #pts = キル×10 + 最大コンボ×20 − 秒
# 例: function hook:score/show {s:150,a:100,b:50}
scoreboard players operation #sec hook.score = #time hook.score
scoreboard players operation #sec hook.score /= #20 hook.constant
scoreboard players operation #pts hook.score = #kills hook.score
scoreboard players operation #pts hook.score *= #10 hook.constant
scoreboard players operation #a hook.temporary = #combo_max hook.score
scoreboard players operation #a hook.temporary *= #20 hook.constant
scoreboard players operation #pts hook.score += #a hook.temporary
scoreboard players operation #pts hook.score -= #sec hook.score
tellraw @a [{text:"撃破 ",color:"gray"},{score:{name:"#kills",objective:"hook.score"},color:"white"},{text:"  最大コンボ ",color:"gray"},{score:{name:"#combo_max",objective:"hook.score"},color:"white"},{text:"  時間 ",color:"gray"},{score:{name:"#sec",objective:"hook.score"},color:"white"},{text:"秒  点 ",color:"gray"},{score:{name:"#pts",objective:"hook.score"},color:"white"}]
$execute if score #pts hook.score matches $(s).. run return run function hook:score/rank {r:"S",c:"gold"}
$execute if score #pts hook.score matches $(a).. run return run function hook:score/rank {r:"A",c:"red"}
$execute if score #pts hook.score matches $(b).. run return run function hook:score/rank {r:"B",c:"aqua"}
function hook:score/rank {r:"C",c:"gray"}
