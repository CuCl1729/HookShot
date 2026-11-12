#> hook:stage/3/wave/tick
# in hook:world、#wave 1〜3 の間。#wt 待ってから波 #wave を出し(#ws 1)、全滅したら次へ
execute if score #wt hook.s3 matches 1.. run scoreboard players remove #wt hook.s3 1
execute if score #wt hook.s3 matches 0 if score #ws hook.s3 matches 0 run function hook:stage/3/wave/spawn
execute if score #ws hook.s3 matches 1 unless entity @e[tag=hook.s3w] run function hook:stage/3/wave/clear
