#> hook:hook/impact
# @s = 突っ込まれた重い敵。#vx/#vz = プレイヤーの速度(×100)。その 3 倍で水平に、少し上へ飛ばす。
# tag hook.impacted を付ける(ボス側が「突き飛ばされた」を知るため。消すのはボス側)
scoreboard players operation #ix hook.temporary = #vx hook.temporary
scoreboard players operation #iz hook.temporary = #vz hook.temporary
scoreboard players operation #ix hook.temporary *= #3 hook.constant
scoreboard players operation #iz hook.temporary *= #3 hook.constant
execute store result entity @s Motion[0] double 0.01 run scoreboard players get #ix hook.temporary
execute store result entity @s Motion[2] double 0.01 run scoreboard players get #iz hook.temporary
scoreboard players set #iy hook.temporary 40
execute store result entity @s Motion[1] double 0.01 run scoreboard players get #iy hook.temporary
tag @s add hook.impacted
scoreboard players operation @s hook.mv = #mv_t hook.cfg
scoreboard players set @s hook.vh 0
particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 1 1.2
# 小衝撃波: 半径 4 の軽い敵を外向き・少し上へ弾く(#shock_v)
particle minecraft:sweep_attack ~ ~1 ~ 1.5 0.2 1.5 0 12 force @a
execute as @e[tag=hook.enemy,tag=!hook.heavy,tag=!hook.boss,tag=!hook.grabbed,tag=!hook.thrown,distance=..4] at @s facing entity @e[tag=hook.anchor,limit=1] feet rotated ~180 -30 run function hook:combat/fling
