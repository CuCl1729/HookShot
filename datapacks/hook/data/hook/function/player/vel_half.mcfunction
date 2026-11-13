#> hook:player/vel_half
# @s = プレイヤー(player/vel から)。前の #stall tick 止まっていた = #stall + 1 tick 分の移動がまとめて届いたので、速度をその数で割る
scoreboard players add #stall hook.temporary 1
scoreboard players operation #vx hook.temporary /= #stall hook.temporary
scoreboard players operation #vy hook.temporary /= #stall hook.temporary
scoreboard players operation #vz hook.temporary /= #stall hook.temporary