#> hook:stage/3/mv/tick
# in hook:world、毎 tick。4 tick ごとに動く錨を1マス動かす
scoreboard players add #mvt hook.s3 1
execute if score #mvt hook.s3 matches ..3 run return 0
scoreboard players set #mvt hook.s3 0
function hook:stage/3/mv/step
