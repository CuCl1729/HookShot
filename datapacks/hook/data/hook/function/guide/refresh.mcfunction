#> hook:guide/refresh
# サイドバーを書き直す(目的・欠片 n/3・難易度・鈴の使い方)。目的が無い間は出さない
# guide/set・diff/apply・fx/shard_get から
execute unless data storage hook: guide.text run return 0
data modify storage hook: hud set value {}
data modify storage hook: hud.text set from storage hook: guide.text
data modify storage hook: hud.d set from storage hook: diff.name
execute store result storage hook: hud.n int 1 run scoreboard players get #shards hook.score
function hook:guide/lines with storage hook: hud
scoreboard objectives setdisplay sidebar hook.guide
