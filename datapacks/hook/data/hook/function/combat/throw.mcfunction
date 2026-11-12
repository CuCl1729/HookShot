#> hook:combat/throw
# @s = 敵を掴んでいるプレイヤー(実行位置・向きも @s)。掴んだ敵を視線方向へ一直線に投げる。
# 弾は目印 hook.proj(敵の体の中心。向き = 視線)が運び、敵は毎 tick その下へ tp する(hook:combat/proj_tick)
execute as @e[type=marker,tag=hook.proj] at @s run function hook:combat/proj_end
tag @e[tag=hook.grabbed] add hook.thrown
tag @e[tag=hook.thrown] remove hook.grabbed
execute at @e[tag=hook.thrown,limit=1] positioned ~ ~0.9 ~ run summon marker ~ ~ ~ {Tags:["hook.proj"]}
execute positioned as @n[type=marker,tag=hook.proj] run tp @n[type=marker,tag=hook.proj] ~ ~ ~ facing ^ ^ ^1
scoreboard players operation @e[type=marker,tag=hook.proj] hook.spd = #throw_t hook.cfg
playsound minecraft:item.trident.throw player @a ~ ~ ~ 1 0.8
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 1 1.2
