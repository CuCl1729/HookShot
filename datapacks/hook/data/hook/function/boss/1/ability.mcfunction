#> hook:boss/1/ability
# 能力1「ヘビーインパクト」
scoreboard players set @a[scores={hook.stage=1}] hook.ability 1
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 1.2
title @a[scores={hook.stage=1}] times 10 60 20
title @a[scores={hook.stage=1}] subtitle {text:"重い敵に飛びつくと、突き飛ばす",color:"gray"}
title @a[scores={hook.stage=1}] title {text:"能力1 ヘビーインパクト",color:"gold"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"能力1「ヘビーインパクト」: 重い敵へ飛んで着くと、その敵を進む向きへ突き飛ばす。壁やトゲにぶつければ倒れる。着いた周りの軽い敵も弾き飛ばす。",color:"gray"}]
