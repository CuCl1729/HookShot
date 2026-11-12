#> hook:dev/push_again
# 1 tick 後にもう一度押す(dev/push の続き。連続 tick の push が効くかを測る)
execute as @a[tag=hook.rec] at @s run function hook:motion/player/push
