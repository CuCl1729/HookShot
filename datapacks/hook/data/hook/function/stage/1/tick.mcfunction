#> hook:stage/1/tick
# 誰かが水晶坑道(hook.stage=1)にいる間、毎 tick(core の tick から)
execute unless data storage hook: built{s1:1b} run function hook:stage/1/build
# 建つまで(チャンク読み込み待ち)はチェックポイントに留めておく。でないと足場が無く落下→復帰を繰り返す
execute unless data storage hook: built{s1:1b} as @a[scores={hook.stage=1}] run function hook:cp/return
execute as @a[scores={hook.stage=1}] at @s run function hook:stage/1/player
function hook:boss/1/tick
