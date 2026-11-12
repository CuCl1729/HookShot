#> hook:stage/2/a/arm
# @s = 撃たれた A のプレスの標的の marker(実行位置 = 標的の中心)。一番近い待機中のプレスの導火線に点火(40 tick 後に落ちる)
execute as @n[type=marker,tag=hook.press,distance=..5] if score @s hook.press matches 0 unless score @s hook.s2 matches 1.. run scoreboard players set @s hook.s2 40
playsound minecraft:entity.tnt.primed block @a ~ ~ ~ 1.5 1
