#> hook:stage/3/arrive/hidden
# @s = 広場の真下の隠し祠 HI に降りたプレイヤー。爆弾兵を岩 HR の三体へ投げればまとめて吹き飛ぶ
scoreboard players set #hid hook.s3 1
execute in hook:world positioned 1081.5 51 3.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s3
execute in hook:world positioned 1089.5 51 0.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
execute in hook:world positioned 1088.5 51 -0.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
execute in hook:world positioned 1090.5 51 1.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 0.7
title @s actionbar {text:"隠し祠を見つけた",color:"gold"}
tellraw @s {text:"爆弾兵を岩の三体へ投げ込めば、まとめて吹き飛ぶ。",color:"gray"}
