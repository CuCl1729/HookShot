#> hook:stage/3/fell
# @s = 奈落に落ちてチェックポイントへ戻ったプレイヤー。崩れ雲と疾風の環をやり直せる状態に戻す
execute if score #chase hook.s3 matches 1.. unless score #sisl hook.s3 matches 1 run function hook:stage/3/chase/reset
execute if score #ta hook.s3 matches 2.. run scoreboard players set #ta hook.s3 1
