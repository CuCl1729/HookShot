#> hook:combat/proj_switch
# @s = 目印 hook.proj。実行位置 = 標的ブロックの中。フックで撃ったのと同じくスイッチを作動させ、投げた敵は撃破
function hook:hook/switch
execute as @e[tag=hook.thrown] at @s run function hook:combat/slam
kill @s
