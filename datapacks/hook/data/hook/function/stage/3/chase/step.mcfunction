#> hook:stage/3/chase/step
# in hook:world、#chase 1.. の間。300 tick で全部崩れ終わる
scoreboard players add #chase hook.s3 1
function hook:stage/3/chase/tick
execute if score #chase hook.s3 matches 301.. run function hook:stage/3/chase/end
