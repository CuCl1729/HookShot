#> hook:combat/proj_end
# @s = 目印 hook.proj。何にも当たらず飛び終えた。爆弾兵はその場で爆発、ほかは落とす
execute as @e[tag=hook.thrown,tag=hook.bomb] at @s run function hook:enemy/kill
execute as @e[tag=hook.thrown] run function hook:combat/drop
tag @e[tag=hook.thrown] remove hook.thrown
kill @s
