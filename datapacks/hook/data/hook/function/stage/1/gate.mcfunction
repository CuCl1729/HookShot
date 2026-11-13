#> hook:stage/1/gate
# @s = プレイヤー。水晶鍵3つ → 大空洞の東上段の門(格子 x 252)を開ける
scoreboard players set #gate hook.s1 1
execute in hook:world run fill 252 97 -3 252 102 3 minecraft:air
execute in hook:world run particle minecraft:end_rod 252 99.5 0 0.3 2 2.5 0.05 120 force @a
execute in hook:world run particle minecraft:totem_of_undying 252 99.5 0 0.5 2 2.5 0.5 80 force @a
execute in hook:world run particle minecraft:explosion 252 99.5 0 0.3 1.5 2 0 6 force @a
execute in hook:world run particle minecraft:end_rod 230 81 0 0.3 1 0.3 0.1 40 force @a
playsound minecraft:block.iron_door.open master @a ~ ~ ~ 1 0.7
playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 1
playsound minecraft:block.bell.resonate master @a ~ ~ ~ 1 1
title @a[scores={hook.stage=1}] times 5 40 15
title @a[scores={hook.stage=1}] title {text:"門が開いた",color:"light_purple"}
title @a[scores={hook.stage=1}] subtitle {text:"大空洞の東の上段",color:"gray"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"大空洞の東上段の門が開いた。中央の柱の上から、門の床の縁を撃て。",color:"gray"}]
function hook:fairy/say {text:"門が開いたよ！ 欠片の気配はこの奥だ"}
function hook:guide/set {text:"東上段の門から奥へ",x:251,y:97,z:0}
