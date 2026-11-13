scoreboard players set #rdy1 hook.temporary 1
kill @e[type=marker,tag=hooktest.probe1]
say HOOKTEST stage1.built PASS
execute if block 230 50 0 minecraft:deepslate_tiles run say HOOKTEST stage1.floor PASS
execute unless block 230 50 0 minecraft:deepslate_tiles run say HOOKTEST stage1.floor FAIL expected minecraft:deepslate_tiles at 230 50 0
execute if block 230 112 0 minecraft:deepslate_bricks run say HOOKTEST stage1.ceiling PASS
execute unless block 230 112 0 minecraft:deepslate_bricks run say HOOKTEST stage1.ceiling FAIL expected minecraft:deepslate_bricks at 230 112 0
function hook:boss/1/start
schedule function hooktest:stage1/boss 2t
