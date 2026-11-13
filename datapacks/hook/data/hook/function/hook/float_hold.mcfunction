#> hook:hook/float_hold
# @s = フロート中のプレイヤー。縦の速度を #float_vy に合わせる(横は 0 = 押さない)
scoreboard players set #motion hook.X0 0
scoreboard players set #motion hook.Z0 0
scoreboard players operation #motion hook.Y0 = #float_vy hook.cfg
scoreboard players operation #motion hook.Y0 -= #cy hook.temporary
function hook:motion/player/push
