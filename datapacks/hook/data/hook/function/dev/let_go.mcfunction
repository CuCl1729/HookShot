#> hook:dev/let_go
# 試験用(schedule から)。引かれているプレイヤーを離す(スニークを押した瞬間・撃ち直しが外れたときと同じ hook:hook/release)
execute as @a[limit=1,tag=hook.pulling] run function hook:hook/release