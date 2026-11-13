#> hook:dev/b3auto_throw
# 試験用(dev/b3auto から)。@s = プレイヤー。王の胴へ向けて投げる
scoreboard players set #cool hook.dev 20
tp @s ~ ~ ~ facing entity @n[tag=hook.boss3] eyes
tellraw @a "b3auto throw"
execute at @s run function hook:hook/fire
