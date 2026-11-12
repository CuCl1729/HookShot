#> hook:boss/3/hit
# @s = 虚の王(実行位置も、hook:world)。hook:boss/hit から(トゲ・プレス・奈落・投げた敵・爆弾兵の爆発。トゲの上では毎 tick)。
# 見分け: y<32 = 奈落 / 近くで爆弾兵が爆発中 = 爆発 / 近くに投げられた敵 = 投げ当て / 足元に amethyst_cluster = トゲ / 上のプレスが落下中 = プレス
execute unless score #state hook.b3 matches 1 unless score #state hook.b3 matches 3 run return 0
execute if score @s hook.y matches ..31 run return run function hook:boss/3/fall
execute if entity @e[tag=hook.bomb,tag=hook.dying,distance=..5] run return run function hook:boss/3/blast
execute if entity @e[tag=hook.thrown,tag=!hook.dying,distance=..4] run return run function hook:boss/3/stagger
execute if score #inv hook.b3 matches 1.. run return 0
execute unless score #stag hook.b3 matches 1.. run return run title @a[scores={hook.stage=4}] actionbar {text:"虚に守られている…怯ませてからだ",color:"gray"}
execute if block ~ ~ ~ minecraft:amethyst_cluster run return run function hook:boss/3/wound
execute positioned ~ ~6 ~ if entity @e[type=marker,tag=hook.press,scores={hook.press=3..8},distance=..4] run function hook:boss/3/wound
