#> hook:stage/3/tick
# 誰かが天空回廊(hook.stage=3)にいる間、毎 tick(core の tick から)
execute unless data storage hook: built{s3:1b} run function hook:stage/3/build
# 建つまで(チャンク読み込み待ち)はチェックポイントに留めておく。でないと足場が無く落下→復帰を繰り返す
execute unless data storage hook: built{s3:1b} as @a[scores={hook.stage=3}] run function hook:cp/return
execute unless data storage hook: built{s3:1b} run return 0
execute in hook:world run function hook:stage/3/mv/tick
execute if score #ta hook.s3 matches 1.. in hook:world run function hook:stage/3/ta/tick
execute if score #chase hook.s3 matches 1.. in hook:world run function hook:stage/3/chase/step
execute if score #wave hook.s3 matches 1..3 in hook:world run function hook:stage/3/wave/tick
execute if score #end hook.s3 matches 1.. run function hook:stage/3/ending
execute as @a[scores={hook.stage=3}] at @s run function hook:stage/3/player
# 光の粒(隠し要素。近づいたら hook:lore/pick が数えて消す)
execute in hook:world as @e[type=item_display,tag=hook.lore] at @s if entity @a[distance=..2.5] run function hook:lore/pick
