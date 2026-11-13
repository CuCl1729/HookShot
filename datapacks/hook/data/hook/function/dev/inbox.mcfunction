#> hook:dev/inbox
# load から(#inbox hook.dev = 1 のときだけ)。tools/mcrun.mjs が書いた inbox_seq の番号が実行済み(#done)より大きいときだけ inbox_body を1回、プレイヤーとして実行する
function hook:dev/inbox_seq
execute unless score #seq hook.dev > #done hook.dev run return 0
scoreboard players operation #done hook.dev = #seq hook.dev
scoreboard players set #ran hook.dev 0
tellraw @a ["MCIN ",{score:{name:"#done",objective:"hook.dev"}}," begin"]
# マクロで呼ぶ: body が構文エラーで読み込まれなくても、この関数は読み込まれて fail を出せる
execute as @a[limit=1] at @s run function hook:dev/inbox_call {f:"hook:dev/inbox_body"}
# #ran は mcrun が body の最後に足す行が立てる
execute if score #ran hook.dev matches 0 run tellraw @a ["MCIN ",{score:{name:"#done",objective:"hook.dev"}}," fail"]
execute if score #ran hook.dev matches 1 unless score #hold hook.dev matches 1.. run function hook:dev/inbox_end
