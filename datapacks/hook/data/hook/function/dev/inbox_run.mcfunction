#> hook:dev/inbox_run
# hook:dev/inbox が reload の 20 tick 後に呼ぶ。inbox_body をプレイヤー(@s)として1回実行し、begin / end / fail を出す
scoreboard players set #ran hook.dev 0
tellraw @a ["MCIN ",{score:{name:"#done",objective:"hook.dev"}}," begin"]
# マクロで呼ぶ: body が構文エラーで読み込まれなくても、この関数は読み込まれて fail を出せる
execute as @a[limit=1] at @s run function hook:dev/inbox_call {f:"hook:dev/inbox_body"}
# #ran は mcrun が body の最後に足す行が立てる
execute if score #ran hook.dev matches 0 run tellraw @a ["MCIN ",{score:{name:"#done",objective:"hook.dev"}}," fail"]
execute if score #ran hook.dev matches 1 unless score #hold hook.dev matches 1.. run function hook:dev/inbox_end
