#> hook:combat/yank_tick
# @s = 引き寄せ中の軽い敵(実行位置も @s)。掴む位置(hook.hp)へ 0.5 刻みで tp。加速 #y_v0 → +#y_acc → #y_vmax。
# 途中で壁・他の敵に #slam_v 以上でぶつかると叩きつけで撃破
execute unless entity @a[tag=hook.owner] run return run function hook:combat/drop
scoreboard players operation @s hook.mv = #mv_t hook.cfg
data modify entity @s Motion set value [0d,0d,0d]
execute if score @s hook.spd matches 1.. run scoreboard players operation @s hook.spd += #y_acc hook.cfg
execute if score @s hook.spd matches 0 run scoreboard players operation @s hook.spd = #y_v0 hook.cfg
execute if score @s hook.spd > #y_vmax hook.cfg run scoreboard players operation @s hook.spd = #y_vmax hook.cfg
function hook:combat/hold_point with storage hook: cfg
execute if entity @n[type=marker,tag=hook.hp,distance=..1.6] run return run function hook:combat/grab
particle minecraft:crit ~ ~1 ~ 0.2 0.3 0.2 0 3 force @a
scoreboard players operation #steps hook.temporary = @s hook.spd
scoreboard players operation #steps hook.temporary /= #50 hook.constant
tag @s add hook.self
execute facing entity @n[type=marker,tag=hook.hp] feet run function hook:combat/yank_step
tag @s remove hook.self
kill @e[type=marker,tag=hook.hp]
