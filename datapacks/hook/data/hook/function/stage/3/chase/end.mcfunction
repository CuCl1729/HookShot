#> hook:stage/3/chase/end
# in hook:world。崩れ終わった。南の島に着いていなければ(引き返した等)雲を戻す
scoreboard players set #chase hook.s3 0
execute unless score #sisl hook.s3 matches 1 run function hook:stage/3/chase/build
