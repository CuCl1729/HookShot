#> hook:stage/3/ending
# 門をくぐってからの演出。#end を数え、170 tick でステージ4へ
scoreboard players add #end hook.s3 1
execute if score #end hook.s3 matches 80 run function hook:stage/3/intro
execute if score #end hook.s3 matches 170 run function hook:stage/3/go4
