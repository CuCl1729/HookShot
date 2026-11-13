scoreboard players set #rdy0 hook.temporary 1
kill @e[type=marker,tag=hooktest.probe0]
say HOOKTEST stage0.built PASS
execute if block -25 63 0 minecraft:stone_bricks run say HOOKTEST stage0.start_platform PASS
execute unless block -25 63 0 minecraft:stone_bricks run say HOOKTEST stage0.start_platform FAIL expected minecraft:stone_bricks at -25 63 0
execute if block -4 66 0 minecraft:stone_bricks run say HOOKTEST stage0.wall PASS
execute unless block -4 66 0 minecraft:stone_bricks run say HOOKTEST stage0.wall FAIL expected minecraft:stone_bricks at -4 66 0
execute if block 10 70 0 minecraft:gold_block run say HOOKTEST stage0.gold PASS
execute unless block 10 70 0 minecraft:gold_block run say HOOKTEST stage0.gold FAIL expected minecraft:gold_block at 10 70 0
execute if block -10 63 30 minecraft:amethyst_block run say HOOKTEST stage0.spike_floor PASS
execute unless block -10 63 30 minecraft:amethyst_block run say HOOKTEST stage0.spike_floor FAIL expected minecraft:amethyst_block at -10 63 30
execute if block -10 64 30 minecraft:amethyst_cluster run say HOOKTEST stage0.spike PASS
execute unless block -10 64 30 minecraft:amethyst_cluster run say HOOKTEST stage0.spike FAIL expected minecraft:amethyst_cluster at -10 64 30
execute if block -25 66 29 minecraft:iron_bars run say HOOKTEST stage0.gate_bars PASS
execute unless block -25 66 29 minecraft:iron_bars run say HOOKTEST stage0.gate_bars FAIL expected minecraft:iron_bars at -25 66 29
execute if entity @e[tag=hook.npc] run say HOOKTEST stage0.npc PASS
execute unless entity @e[tag=hook.npc] run say HOOKTEST stage0.npc FAIL no hook.npc
