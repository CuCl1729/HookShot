#> hook:player/fell
# @s = 奈落(y<32)に落ちたプレイヤー。チェックポイントへ戻して、軽い演出だけ(暗転なし)
function hook:cp/return
execute at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 0.7 1.3
execute at @s run playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 1 0.8
execute at @s run particle minecraft:end_rod ~ ~0.3 ~ 0.9 0.2 0.9 0.03 20 force @s
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.4 0.8 0.4 0.05 40 force @s
