#> hook:combat/drop
# @s = 引き寄せ中・掴まれている敵。放す(その場に落ちる。#mv_t の間はギミックで死ねる)
tag @s remove hook.yanking
tag @s remove hook.grabbed
scoreboard players operation @s hook.mv = #mv_t hook.cfg
scoreboard players set @s hook.vh 0
execute if entity @s[tag=hook.bomb] run data modify entity @s Fuse set value 30s
