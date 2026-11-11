#> hook:boss/3/collapse
# hook:world で実行。床を崩して浮島だけ残す。先にチェックポイントを闘技場内の入口の島へ移す(落ちても戦闘が続く)
execute as @a[scores={hook.stage=4}] run function hook:cp/set {id:41,x:1518.5,y:64,z:0.5,yaw:-90}
fill 1516 64 -16 1584 64 16 minecraft:air replace minecraft:amethyst_cluster
fill 1516 62 -16 1584 68 16 minecraft:air
function hook:stage/4/islands
execute as @e[tag=hook.boss3] run tp @s 1550.5 64 0.5
particle minecraft:explosion 1550 63 0 16 1 14 0 60 force @a
playsound minecraft:entity.generic.explode hostile @a 1550 64 0 4 0.5
playsound minecraft:entity.wither.break_block hostile @a 1550 64 0 4 0.5
