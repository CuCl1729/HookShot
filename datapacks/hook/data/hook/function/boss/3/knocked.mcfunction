#> hook:boss/3/knocked
# @s = 能力1で突き飛ばされた王。怯み中なら通して怯みを延ばす(落ちる・標的を撃つまで 7 秒)。それ以外は弾き返す
tag @s remove hook.impacted
execute if score #stag hook.b3 matches 1.. run return run scoreboard players set #stag hook.b3 140
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
particle minecraft:crit ~ ~2 ~ 1 1 1 1 40 force @a
playsound minecraft:item.shield.block hostile @a ~ ~ ~ 2 0.6
title @a[scores={hook.stage=4}] actionbar {text:"虚に弾かれた! 抜け殻を投げつけて怯ませてからだ(第2形態は縛っても怯む)",color:"gray"}
