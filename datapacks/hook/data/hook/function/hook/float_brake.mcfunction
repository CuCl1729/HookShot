#> hook:hook/float_brake
# @s = 浮き始めたプレイヤー。下向きの速さだけ打ち消す
scoreboard players set #motion hook.X0 0
scoreboard players set #motion hook.Z0 0
scoreboard players operation #motion hook.Y0 = #cy hook.temporary
scoreboard players operation #motion hook.Y0 *= #-1 hook.constant
function hook:motion/player/push
