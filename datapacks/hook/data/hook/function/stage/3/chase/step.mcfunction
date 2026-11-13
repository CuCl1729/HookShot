#> hook:stage/3/chase/step
# in hook:world、#chase 1.. の間。400 tick で全部崩れ終わる(gen3.mjs の 70k+50、k 最大 5)
scoreboard players add #chase hook.s3 1
function hook:stage/3/chase/tick
execute if score #chase hook.s3 matches 401.. run function hook:stage/3/chase/end
