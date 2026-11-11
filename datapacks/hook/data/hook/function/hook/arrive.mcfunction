#> hook:hook/arrive
# @s = 錨に着いたプレイヤー。#vx/#vy/#vz = いまの速度(×100)
# 能力1 ヘビーインパクト: 重い敵に突っ込んだら、その敵を進行方向へ突き飛ばす
execute if score @s hook.ability matches 1.. as @e[tag=hook.anchor,tag=hook.heavy] at @s run function hook:hook/impact
# 止まる(速度を打ち消す)
scoreboard players operation #motion hook.X0 = #vx hook.temporary
scoreboard players operation #motion hook.Y0 = #vy hook.temporary
scoreboard players operation #motion hook.Z0 = #vz hook.temporary
scoreboard players operation #motion hook.X0 *= #-1 hook.constant
scoreboard players operation #motion hook.Y0 *= #-1 hook.constant
scoreboard players operation #motion hook.Z0 *= #-1 hook.constant
function hook:motion/player/push
function hook:hook/release
