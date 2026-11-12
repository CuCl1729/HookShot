#> hook:hook/windup
# @s = 溜め中のプレイヤー。いまの速度を半分打ち消して(落下も緩めて)その場に溜まる
scoreboard players operation #motion hook.X0 = #cx hook.temporary
scoreboard players operation #motion hook.Y0 = #cy hook.temporary
scoreboard players operation #motion hook.Z0 = #cz hook.temporary
scoreboard players operation #motion hook.X0 /= #-2 hook.constant
scoreboard players operation #motion hook.Y0 /= #-2 hook.constant
scoreboard players operation #motion hook.Z0 /= #-2 hook.constant
function hook:motion/player/push
