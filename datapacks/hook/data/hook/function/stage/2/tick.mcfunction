#> hook:stage/2/tick
# 誰かが歯車工場(hook.stage=2)にいる間、毎 tick(core の tick から)
execute unless data storage hook: built{s2:1b} run function hook:stage/2/build
# 建つまで(チャンク読み込み待ち)はチェックポイントに留めておく。でないと足場が無く落下→復帰を繰り返す
execute unless data storage hook: built{s2:1b} as @a[scores={hook.stage=2}] run function hook:cp/return
execute unless data storage hook: built{s2:1b} run return 0
function hook:gimmick/press/tick
execute in hook:world run function hook:stage/2/world
execute as @a[scores={hook.stage=2}] at @s run function hook:stage/2/player
function hook:boss/2/tick
