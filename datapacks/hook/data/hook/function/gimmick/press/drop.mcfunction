#> hook:gimmick/press/drop
# @s = 撃たれた標的の hook.switch marker(実行位置 = 標的の中心)。一番近い待機中のプレスを落とす
execute as @n[type=marker,tag=hook.press,distance=..5] if score @s hook.press matches 0 run scoreboard players set @s hook.press 1
