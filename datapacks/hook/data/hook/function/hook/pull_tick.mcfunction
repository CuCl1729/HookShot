#> hook:hook/pull_tick
# @s = 引かれているプレイヤー(実行位置・向きも @s)。#vx/#vy/#vz = いまの速度(player/vel)。
# 溜め(#windup tick)→ #v0 から毎 tick #accel ずつ #vmax まで加速して錨へ一直線 → 手前で arrive(跳ね)。スニークで中断
scoreboard players add @s hook.pull 1
execute unless entity @e[tag=hook.anchor] run return run function hook:hook/release
execute if entity @s[tag=hook.sneak_new] run return run function hook:hook/release
scoreboard players set #chain hook.temporary 90
execute anchored eyes positioned ^ ^ ^ facing entity @n[tag=hook.anchor] feet run function hook:hook/chain
execute if score @s hook.pull <= #windup hook.cfg run return run function hook:hook/windup
function hook:hook/pull_sound

# 時間切れ・詰まり
scoreboard players operation #t hook.temporary = @s hook.pull
scoreboard players operation #t hook.temporary -= #windup hook.cfg
execute if score #t hook.temporary > #maxt hook.cfg run return run function hook:hook/arrive
function hook:hook/stuck_check
execute if score @s hook.stuck >= #stuck hook.cfg run return run function hook:hook/arrive

# 加速
execute if score @s hook.spd matches 1.. run scoreboard players operation @s hook.spd += #accel hook.cfg
execute if score @s hook.spd matches 0 run scoreboard players operation @s hook.spd = #v0 hook.cfg
execute if score @s hook.spd > #vmax hook.cfg run scoreboard players operation @s hook.spd = #vmax hook.cfg

# 終了判定: 錨まで #stop(重い敵は #stop_e)+ 速さ×#lead/100 以内(次の tick に進む分を見込む)
scoreboard players operation #d hook.temporary = @s hook.spd
scoreboard players operation #d hook.temporary *= #lead hook.cfg
scoreboard players operation #d hook.temporary /= #100 hook.constant
execute if entity @n[tag=hook.anchor,type=marker] run scoreboard players operation #d hook.temporary += #stop hook.cfg
execute unless entity @n[tag=hook.anchor,type=marker] run scoreboard players operation #d hook.temporary += #stop_e hook.cfg
execute store result storage hook: tmp.d double 0.01 run scoreboard players get #d hook.temporary
function hook:hook/near with storage hook: tmp
execute if entity @s[tag=hook.arrive] run return run function hook:hook/arrive

# 錨への向き × 速さ − いまの速度 を足す。重い敵へは足元の1上を目指す(台の側面に引っかからないように)
execute if entity @n[tag=hook.anchor,type=marker] facing entity @n[tag=hook.anchor] feet run function hook:util/dir
execute unless entity @n[tag=hook.anchor,type=marker] positioned ~ ~-1 ~ facing entity @n[tag=hook.anchor] feet run function hook:util/dir
scoreboard players operation #motion hook.X0 = #dx hook.temporary
scoreboard players operation #motion hook.Y0 = #dy hook.temporary
scoreboard players operation #motion hook.Z0 = #dz hook.temporary
scoreboard players operation #motion hook.X0 *= @s hook.spd
scoreboard players operation #motion hook.Y0 *= @s hook.spd
scoreboard players operation #motion hook.Z0 *= @s hook.spd
scoreboard players operation #motion hook.X0 /= #1000 hook.constant
scoreboard players operation #motion hook.Y0 /= #1000 hook.constant
scoreboard players operation #motion hook.Z0 /= #1000 hook.constant
scoreboard players operation #motion hook.X0 -= #cx hook.temporary
scoreboard players operation #motion hook.Y0 -= #cy hook.temporary
scoreboard players operation #motion hook.Z0 -= #cz hook.temporary
function hook:motion/player/push
