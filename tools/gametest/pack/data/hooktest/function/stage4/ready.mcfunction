scoreboard players set #rdy4 hook.temporary 1
kill @e[type=marker,tag=hooktest.probe4]
say HOOKTEST stage4.built PASS
execute if block 1530 63 0 minecraft:polished_blackstone run say HOOKTEST stage4.floor PASS
execute unless block 1530 63 0 minecraft:polished_blackstone run say HOOKTEST stage4.floor FAIL expected minecraft:polished_blackstone at 1530 63 0
execute if block 1506 63 0 minecraft:sea_lantern run say HOOKTEST stage4.lantern PASS
execute unless block 1506 63 0 minecraft:sea_lantern run say HOOKTEST stage4.lantern FAIL expected minecraft:sea_lantern at 1506 63 0
function hook:boss/3/start
schedule function hooktest:stage4/boss 2t
