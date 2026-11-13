#> hook:dev/rep
# 試験用(schedule から)。storage hook: dev.w で dev/wall を置き、10 tick 後に撃つ。#rep hook.dev 回、100 tick おきに繰り返す
execute as @a[limit=1] at @s run function hook:dev/wall with storage hook: dev.w
schedule function hook:dev/rep_fire 10t
scoreboard players remove #rep hook.dev 1
execute if score #rep hook.dev matches 1.. run schedule function hook:dev/rep 100t