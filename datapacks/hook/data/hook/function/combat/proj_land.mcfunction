#> hook:combat/proj_land
# @s = 目印 hook.proj(向き = 弾く向き)。投げた敵の着弾: 爆弾兵は爆発(hook:enemy/kill)、ほかは死なずに怯んで
# #knock_v/3 で弾かれる(hook.mv が立つので、その先のギミックで死ねる)
execute as @e[tag=hook.thrown,tag=hook.bomb] at @s run function hook:enemy/kill
scoreboard players operation #kv hook.temporary = #knock_v hook.cfg
scoreboard players operation #kv hook.temporary /= #3 hook.constant
execute rotated as @s rotated ~ -25 as @e[tag=hook.thrown] positioned as @s run function hook:combat/knock
tag @e[tag=hook.thrown] remove hook.thrown
kill @s
