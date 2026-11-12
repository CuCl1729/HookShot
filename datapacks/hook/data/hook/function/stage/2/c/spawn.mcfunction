#> hook:stage/2/c/spawn
# hook:world で実行。ウェーブ #cw の敵を両端の搬入口と奥から出す
# 1: 重装兵 + ゾンビ2(突き飛ばし→衝撃波→プレス)/ 2: 爆弾兵2 + スケルトン(投げて爆発)/ 3: 重装兵2 + ゾンビ + 爆弾兵
execute if score #cw hook.s2 matches 1 positioned 676.5 64 33.5 run function hook:enemy/summon/heavy
execute if score #cw hook.s2 matches 1 positioned 645.5 64 35.5 run function hook:enemy/summon/zombie
execute if score #cw hook.s2 matches 1 positioned 707.5 64 35.5 run function hook:enemy/summon/zombie
execute if score #cw hook.s2 matches 2 positioned 645.5 64 35.5 run function hook:enemy/summon/bomber
execute if score #cw hook.s2 matches 2 positioned 707.5 64 35.5 run function hook:enemy/summon/bomber
execute if score #cw hook.s2 matches 2 positioned 676.5 64 33.5 run function hook:enemy/summon/skeleton
execute if score #cw hook.s2 matches 3 positioned 645.5 64 35.5 run function hook:enemy/summon/heavy
execute if score #cw hook.s2 matches 3 positioned 707.5 64 35.5 run function hook:enemy/summon/heavy
execute if score #cw hook.s2 matches 3 positioned 660.5 64 35.5 run function hook:enemy/summon/zombie
execute if score #cw hook.s2 matches 3 positioned 692.5 64 35.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s2
tag @e[tag=hook.new] add hook.s2c
particle minecraft:large_smoke 645.5 66 35.5 0.5 1 0.5 0 20 force @a
particle minecraft:large_smoke 707.5 66 35.5 0.5 1 0.5 0 20 force @a
playsound minecraft:block.piston.extend block @a[scores={hook.stage=2}] 676 66 30 2 0.6
