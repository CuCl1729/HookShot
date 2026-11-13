scoreboard players set #rdy3 hook.temporary 1
kill @e[type=marker,tag=hooktest.probe3]
say HOOKTEST stage3.built PASS
execute if block 1010 63 0 minecraft:smooth_quartz run say HOOKTEST stage3.floor PASS
execute unless block 1010 63 0 minecraft:smooth_quartz run say HOOKTEST stage3.floor FAIL expected minecraft:smooth_quartz at 1010 63 0
execute if block 1072 71 -8 minecraft:target run say HOOKTEST stage3.target PASS
execute unless block 1072 71 -8 minecraft:target run say HOOKTEST stage3.target FAIL expected minecraft:target at 1072 71 -8
