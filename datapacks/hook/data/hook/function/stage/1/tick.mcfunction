#> hook:stage/1/tick
# 誰かが水晶坑道(hook.stage=1)にいる間、毎 tick(core の tick から)
execute unless data storage hook: built{s1:1b} run function hook:stage/1/build
# 建つまで(チャンク読み込み待ち)はチェックポイントに留めておく。でないと足場が無く落下→復帰を繰り返す
execute unless data storage hook: built{s1:1b} as @a[scores={hook.stage=1}] run return run function hook:cp/return
execute as @a[scores={hook.stage=1}] at @s run function hook:stage/1/player
execute if score #bw hook.s1 matches 1..3 in hook:world run function hook:stage/1/b/waves
execute if score #c hook.s1 matches 1 if score #cn hook.s1 matches ..2 if score #tick hook.temporary matches 0 in hook:world run function hook:stage/1/c/feed
function hook:boss/1/tick
