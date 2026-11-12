#> hook:boss/2/act/summon
# @s = 番人。HP2 以下: 部品(雑魚)を2体呼ぶ(HP2 ゾンビ2 / HP1 ゾンビ + 爆弾兵)。番人に投げ当てれば 5 秒動けなくなる
execute if score #t hook.b2 matches 1 run playsound minecraft:block.anvil.use hostile @a ~ ~ ~ 2 1.2
execute if score #t hook.b2 matches 1 run particle minecraft:large_smoke ~ ~3 ~ 0.5 0.5 0.5 0.05 30 force @a
execute if score #t hook.b2 matches 1 run particle minecraft:large_smoke 830.5 68 -5.5 0.5 1 0.5 0 20 force @a
execute if score #t hook.b2 matches 1 run particle minecraft:large_smoke 852.5 68 5.5 0.5 1 0.5 0 20 force @a
execute if score #t hook.b2 matches 20 positioned 830.5 64 -5.5 run function hook:enemy/summon/zombie
execute if score #t hook.b2 matches 20 if score #hp hook.b2 matches 2.. positioned 852.5 64 5.5 run function hook:enemy/summon/zombie
execute if score #t hook.b2 matches 20 if score #hp hook.b2 matches ..1 positioned 852.5 64 5.5 run function hook:enemy/summon/bomber
execute if score #t hook.b2 matches 20 run tag @e[tag=hook.new] add hook.s2
execute if score #t hook.b2 matches 20 run tag @e[tag=hook.new] add hook.s2bm
execute if score #t hook.b2 matches 30 run function hook:boss/2/set {a:0}
