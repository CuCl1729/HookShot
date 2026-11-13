#> hook:dev/throw_s
# 試験用(schedule から)。tag dev.y の敵の足へ向けて右クリック(掴んでいれば投げる)
execute as @a[limit=1] at @s run function hook:dev/aim_at {tag:"dev.y"}
