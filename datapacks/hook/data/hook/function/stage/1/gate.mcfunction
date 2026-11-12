#> hook:stage/1/gate
# @s = プレイヤー。水晶鍵3つ → 大空洞の東上段の門(格子 x 252)を開ける
scoreboard players set #gate hook.s1 1
execute in hook:world run fill 252 97 -3 252 102 3 minecraft:air
execute in hook:world run particle minecraft:end_rod 252 99.5 0 0.3 2 2.5 0.02 60 force @a
playsound minecraft:block.iron_door.open master @a ~ ~ ~ 1 0.7
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"大空洞の東上段の門が開いた。中央の柱の上から、門の床の縁を撃て。",color:"gray"}]
