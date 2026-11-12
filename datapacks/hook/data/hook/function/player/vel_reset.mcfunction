#> hook:player/vel_reset
# テレポートなどで位置が飛んだ tick。速度 0 とみなす
scoreboard players set #vx hook.temporary 0
scoreboard players set #vy hook.temporary 0
scoreboard players set #vz hook.temporary 0
