#> hook:boss/1/results
# ステージ1の評価を出し、storage hook: ranks.s1 {r,c,g,pts} に残す(写し元: stage/5/results)
tellraw @a[scores={hook.stage=1}] {text:"―― 水晶坑道 ――",color:"light_purple",bold:true}
# shortcut: 閾値は推定(撃破 25・最大コンボ 3・15〜20 分で A 程度)。通しプレイの実測で直す
function hook:score/show {s:-500,a:-800,b:-1100}
data modify storage hook: ranks.s1 set value {r:"C",c:"gray",g:0}
execute if score #pts hook.score matches -1100.. run data modify storage hook: ranks.s1 set value {r:"B",c:"aqua",g:1}
execute if score #pts hook.score matches -800.. run data modify storage hook: ranks.s1 set value {r:"A",c:"red",g:2}
execute if score #pts hook.score matches -500.. run data modify storage hook: ranks.s1 set value {r:"S",c:"gold",g:3}
execute store result storage hook: ranks.s1.pts int 1 run scoreboard players get #pts hook.score
