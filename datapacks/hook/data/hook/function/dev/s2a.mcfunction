#> hook:dev/s2a
# 試験用。@macro x = 台車を置く x、p = 点火する A のプレスの中心 x。台車を置いてそのプレスの導火線に点火する(40 tick 後に落ちる)
$tp @e[type=block_display,tag=hook.s2core] $(x) 64 -27.5
$execute in hook:world positioned $(p).5 70 -27.5 as @n[type=marker,tag=hook.press,distance=..1] run scoreboard players set @s hook.s2 40
