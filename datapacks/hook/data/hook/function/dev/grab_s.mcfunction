#> hook:dev/grab_s
# 試験用(schedule から)。tag dev.z の敵へ撃つ(引き寄せ→掴み)
execute as @a[limit=1] at @s run function hook:dev/aim_at {tag:"dev.z"}
