#> hook:stage/3/tick
# 誰かが天空回廊(hook.stage=3)にいる間、毎 tick(core の tick から)
execute unless data storage hook: built{s3:1b} run function hook:stage/3/build
# 建つまで(チャンク読み込み待ち)はチェックポイントに留めておく。でないと足場が無く落下→復帰を繰り返す
execute unless data storage hook: built{s3:1b} as @a[scores={hook.stage=3}] run function hook:cp/return
execute as @a[scores={hook.stage=3}] at @s run function hook:stage/3/player
