#> hook:boss/3/ring_at
# hook:world。#r = 輪の半径。半径 #r-1〜#r の帯を当たり判定にして描く(#r は呼び出し元へ戻す)
execute store result storage hook: b3.r int 1 run scoreboard players get #r hook.b3
scoreboard players remove #r hook.b3 1
execute store result storage hook: b3.lo int 1 run scoreboard players get #r hook.b3
scoreboard players add #r hook.b3 1
function hook:boss/3/ring_wave with storage hook: b3
