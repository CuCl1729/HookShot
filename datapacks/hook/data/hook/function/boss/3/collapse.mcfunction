#> hook:boss/3/collapse
# hook:world。床を崩して浮島だけ残す(高い所のフックポイントと、プレスの筐体 y 71〜 は残る)
fill 1516 64 -16 1584 64 16 minecraft:air replace minecraft:amethyst_cluster
fill 1516 62 -16 1584 68 16 minecraft:air
function hook:stage/4/islands
execute as @e[tag=hook.boss3] run tp @s 1550.5 64 0.5
particle minecraft:explosion 1550 63 0 16 1 14 0 60 force @a
playsound minecraft:entity.generic.explode hostile @a 1550 64 0 4 0.5
playsound minecraft:entity.wither.break_block hostile @a 1550 64 0 4 0.5
