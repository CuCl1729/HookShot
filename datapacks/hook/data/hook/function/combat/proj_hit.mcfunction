#> hook:combat/proj_hit
# @s = 目印 hook.proj。実行位置 = 当たった所(足の高さ)。当たった敵は投げた向きへ #knock_v で弾かれて怯む(死なない)、
# ボスは hook:boss/hit(怯ませる)。投げた敵は hook:combat/proj_land(ボスに当たったときは跳ね返る)
execute as @e[tag=hook.boss,tag=!hook.dying,distance=..2.5] at @s run function hook:enemy/kill
scoreboard players operation #kv hook.temporary = #knock_v hook.cfg
execute rotated as @s rotated ~ -25 as @e[tag=hook.enemy,tag=!hook.boss,tag=!hook.thrown,tag=!hook.dying,distance=..1.4] positioned as @s run function hook:combat/knock
execute if entity @e[tag=hook.boss,distance=..2.5] run tp @s ~ ~ ~ ~180 ~
function hook:combat/proj_land
