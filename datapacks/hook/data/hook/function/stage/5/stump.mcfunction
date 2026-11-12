#> hook:stage/5/stump
# 最後の太陽石の欠片(光る塊)を玉座の上空に出す。玉座の島 x 1550 から見上げる位置(距離 約 32、フック射程 40 の内)。
# 一番下の標的(1556,96,0)を撃つと hook:stage/5/shot(標的ブロックへのフックは引っ張りを起こさず、スイッチだけ作動する)
scoreboard players set #stump hook.b3 1
execute in hook:world run kill @e[type=marker,tag=hook.s5m]
execute in hook:world run fill 1555 97 -1 1557 99 1 minecraft:glowstone
execute in hook:world run setblock 1556 96 0 minecraft:target
execute in hook:world run summon marker 1556.5 96.5 0.5 {Tags:["hook.switch","hook.s5m"],data:{f:"hook:stage/5/shot"}}
execute in hook:world run particle minecraft:end_rod 1556.5 98 0.5 1.5 2 1.5 0.05 80 force @a
execute in hook:world run playsound minecraft:block.beacon.activate master @a 1550 64 0 4 1.5
