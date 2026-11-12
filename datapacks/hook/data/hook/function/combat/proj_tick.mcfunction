#> hook:combat/proj_tick
# @s = 投げた敵を運ぶ目印 hook.proj(実行位置・向きも @s)。hook.spd = 残り tick。0.5 × #throw_steps 進む
execute unless entity @e[tag=hook.thrown] run return run kill @s
execute if score @s hook.spd matches ..0 run return run function hook:combat/proj_end
scoreboard players remove @s hook.spd 1
execute as @e[tag=hook.thrown] run scoreboard players operation @s hook.mv = #mv_t hook.cfg
scoreboard players operation #steps hook.temporary = #throw_steps hook.cfg
function hook:combat/proj_step
execute as @e[tag=hook.thrown] run data modify entity @s Motion set value [0d,0d,0d]
particle minecraft:cloud ~ ~ ~ 0.1 0.1 0.1 0 2 force @a
