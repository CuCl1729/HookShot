#> hook:boss/2/act/leap
# @s = 番人(実行位置も)。跳躍: t=1 でプレイヤーの足元を着地点に固定 → #ltel tick 予告(炎の円)→ 跳び上がって着地点の 12 上に浮き(円が続く)→ 落ちる。
# 着地の衝撃は地面近くの 7x7 だけ(フックで離れればよい)。着地後 5 秒動けない(プレスの範囲で誘えば、そのまま潰せる)
execute if score #t hook.b2 matches 1 at @p[scores={hook.stage=2}] run summon marker ~ 64 ~ {Tags:["hook.b2land","hook.b2m"]}
execute if score #t hook.b2 matches 1 as @e[type=marker,tag=hook.b2land] unless entity @s[x=821,y=60,z=-12,dx=40,dy=10,dz=24] run tp @s 841.5 64 0.5
execute if score #t hook.b2 matches 1 run playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 2 0.8
execute if score #t hook.b2 <= #ltel hook.b2 at @e[type=marker,tag=hook.b2land,limit=1] run function hook:boss/2/act/leap_ring
execute if score #t hook.b2 <= #ltel hook.b2 run return run particle minecraft:large_smoke ~ ~0.3 ~ 0.6 0.1 0.6 0 2 force @a
scoreboard players operation #e hook.b2 = #t hook.b2
scoreboard players operation #e hook.b2 -= #ltel hook.b2
execute if score #e hook.b2 matches 1 run particle minecraft:cloud ~ ~0.5 ~ 1 0.2 1 0.05 20 force @a
execute if score #e hook.b2 matches 1 run playsound minecraft:entity.iron_golem.attack hostile @a ~ ~ ~ 2 0.5
execute if score #e hook.b2 matches 1..8 at @e[type=marker,tag=hook.b2land,limit=1] run tp @s ~ ~12 ~
execute if score #e hook.b2 matches 1..8 at @e[type=marker,tag=hook.b2land,limit=1] run function hook:boss/2/act/leap_ring
execute if score #e hook.b2 matches 9 at @e[type=marker,tag=hook.b2land,limit=1] run tp @s ~ ~10 ~
execute if score #e hook.b2 matches 10 at @e[type=marker,tag=hook.b2land,limit=1] run tp @s ~ ~8 ~
execute if score #e hook.b2 matches 11 at @e[type=marker,tag=hook.b2land,limit=1] run tp @s ~ ~6 ~
execute if score #e hook.b2 matches 12 at @e[type=marker,tag=hook.b2land,limit=1] run tp @s ~ ~4 ~
execute if score #e hook.b2 matches 13 at @e[type=marker,tag=hook.b2land,limit=1] run tp @s ~ ~2 ~
execute if score #e hook.b2 matches 14 at @e[type=marker,tag=hook.b2land,limit=1] run tp @s ~ ~ ~
execute if score #e hook.b2 matches 14 at @s run function hook:boss/2/act/land
