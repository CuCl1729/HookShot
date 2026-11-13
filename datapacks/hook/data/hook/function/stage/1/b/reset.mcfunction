#> hook:stage/1/b/reset
# 波の途中で誰も広間にいなくなった(in hook:world)。敵を消して格子を開け、入り直すと第1波から(arrive/b)
kill @e[tag=hook.s1b]
fill 226 71 28 234 76 28 minecraft:air
scoreboard players set #bw hook.s1 0
scoreboard players set #bt hook.s1 0
function hook:stage/1/goal
