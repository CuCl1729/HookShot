#> hook:stage/3/wave/open
# in hook:world。番兵を全部落とした → 門の鉄格子を外す
fill 1292 99 -2 1292 103 2 minecraft:air replace minecraft:iron_bars
particle minecraft:end_rod 1292 101 0 0.3 2 2 0.02 60 force @a
playsound minecraft:block.iron_door.open block @a 1292 101 0 3 0.7
tellraw @a[scores={hook.stage=3}] {text:"門が開いた。くぐろう。",color:"gray"}
