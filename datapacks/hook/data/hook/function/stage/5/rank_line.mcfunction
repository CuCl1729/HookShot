#> hook:stage/5/rank_line
# @macro s = ranks のキー(s1〜s4)/ n = ステージ名。storage hook: ranks.<s> があればランクと点、無ければ「―」
$execute unless data storage hook: ranks.$(s).r run return run tellraw @a[scores={hook.stage=5}] [{text:"  $(n)  ",color:"gray"},{text:"―",color:"dark_gray"}]
$data modify storage hook: tmp.line set from storage hook: ranks.$(s)
$data modify storage hook: tmp.line.n set value "$(n)"
execute unless data storage hook: tmp.line.c run data modify storage hook: tmp.line.c set value "white"
execute unless data storage hook: tmp.line.pts run data modify storage hook: tmp.line.pts set value 0
function hook:stage/5/rank_show with storage hook: tmp.line
