scoreboard players set #rdy2 hook.temporary 1
kill @e[type=marker,tag=hooktest.probe2]
say HOOKTEST stage2.built PASS
execute if block 620 63 0 minecraft:polished_deepslate run say HOOKTEST stage2.floor PASS
execute unless block 620 63 0 minecraft:polished_deepslate run say HOOKTEST stage2.floor FAIL expected minecraft:polished_deepslate at 620 63 0
execute if block 700 80 41 minecraft:deepslate_tiles run say HOOKTEST stage2.wall PASS
execute unless block 700 80 41 minecraft:deepslate_tiles run say HOOKTEST stage2.wall FAIL expected minecraft:deepslate_tiles at 700 80 41
function hook:boss/2/start
schedule function hooktest:stage2/boss 2t
