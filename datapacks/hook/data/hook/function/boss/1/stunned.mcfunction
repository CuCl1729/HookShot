#> hook:boss/1/stunned
# よろけ(隙)
particle minecraft:crit ~ ~4.6 ~ 0.5 0.1 0.5 0 2 force @a
execute if score #t hook.b1 matches ..0 run function hook:boss/1/idle
