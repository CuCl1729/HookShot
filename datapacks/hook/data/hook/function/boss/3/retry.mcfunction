#> hook:boss/3/retry
# 第2形態のやり直し(冪等): 雑魚を消し、王を玉座の島へ戻し、HP を第2形態の頭(2)に
kill @e[tag=hook.b3m]
execute in hook:world run function hook:stage/4/islands
execute as @e[tag=hook.boss3] in hook:world run tp @s 1550.5 64 0.5
execute as @e[tag=hook.boss3] run data modify entity @s Motion set value [0.0d,0.0d,0.0d]
scoreboard players set #hp hook.b3 2
scoreboard players set #inv hook.b3 40
scoreboard players set #vuln hook.b3 0
scoreboard players set #warp hook.b3 0
scoreboard players set #spawn hook.b3 200
function hook:core/call {f:"hook:boss/3/bar_set"}
tellraw @a[scores={hook.stage=4}] {text:"虚の王は玉座の島へ戻った……(第二形態から再開)",color:"gray",italic:true}
