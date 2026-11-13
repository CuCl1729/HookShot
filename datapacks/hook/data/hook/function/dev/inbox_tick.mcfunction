#> hook:dev/inbox_tick
# tick から(#inbox hook.dev = 1 のときだけ)。60 tick おきに reload し、load から hook:dev/inbox を走らせる。#hold の間(mcrun -after の待ち)は reload しない
execute if score #hold hook.dev matches 1.. run return run scoreboard players remove #hold hook.dev 1
scoreboard players add #t hook.dev 1
execute if score #t hook.dev matches ..59 run return 0
scoreboard players set #t hook.dev 0
reload
