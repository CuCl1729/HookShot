#> hook:fx/kill
# 実行位置 = 倒れた雑魚(score/kill から自動)。光がはじける
particle minecraft:crit ~ ~1 ~ 0.4 0.5 0.4 0.5 30 force @a
particle minecraft:end_rod ~ ~1 ~ 0.2 0.3 0.2 0.15 15 force @a
particle minecraft:soul ~ ~0.8 ~ 0.3 0.4 0.3 0.03 8 force @a
playsound minecraft:entity.player.attack.crit master @a ~ ~ ~ 1 1.2
playsound minecraft:block.amethyst_block.break master @a ~ ~ ~ 1 1.4
