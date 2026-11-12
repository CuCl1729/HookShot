#> hook:boss/3/retry
# 第2形態のやり直し(冪等): 手下と予告を消し、王を玉座の島へ戻し、HP を第2形態の頭(3)に
kill @e[tag=hook.b3m]
execute in hook:world run function hook:stage/4/islands
execute as @e[tag=hook.boss3] in hook:world run function hook:boss/3/home
scoreboard players set #hp hook.b3 3
scoreboard players set #inv hook.b3 40
scoreboard players set #cd hook.b3 60
function hook:core/call {f:"hook:boss/3/bar_set"}
tellraw @a[scores={hook.stage=4}] {text:"虚の王は玉座の島へ戻った……(第二形態から再開)",color:"gray",italic:true}
