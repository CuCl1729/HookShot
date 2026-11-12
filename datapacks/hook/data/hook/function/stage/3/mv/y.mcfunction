#> hook:stage/3/mv/y
# #o = 位相 0〜79 → storage hook: s3m.y(板の下端 53〜92)と yh(上端)
execute if score #o hook.s3 matches 40.. run scoreboard players operation #o hook.s3 *= #-1 hook.constant
execute if score #o hook.s3 matches ..-1 run scoreboard players add #o hook.s3 79
scoreboard players add #o hook.s3 53
execute store result storage hook: s3m.y int 1 run scoreboard players get #o hook.s3
scoreboard players add #o hook.s3 2
execute store result storage hook: s3m.yh int 1 run scoreboard players get #o hook.s3
