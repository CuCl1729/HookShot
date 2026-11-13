# 導入の build が済んだ後。標的 3 つ・スイッチ・長老・閉じた扉を見て、各標的(pick0〜2)で難易度と扉が変わることを確かめる
scoreboard players set #rdyi hook.temporary 1
say HOOKTEST common.intro_built PASS
execute if block -85 66 -8 minecraft:target if block -80 66 -8 minecraft:target if block -75 66 -8 minecraft:target run say HOOKTEST common.intro_targets PASS
execute unless block -80 66 -8 minecraft:target run say HOOKTEST common.intro_targets FAIL target block missing
execute store result score #n hook.temporary if entity @e[type=marker,tag=hook.switch,tag=hook.intro]
execute if score #n hook.temporary matches 3 run say HOOKTEST common.intro_switches PASS
execute unless score #n hook.temporary matches 3 run say HOOKTEST common.intro_switches FAIL expected 3 switch markers
execute if entity @e[type=mannequin,x=-85,y=62,z=2,dx=3,dy=4,dz=3] run say HOOKTEST common.intro_elder PASS
execute unless entity @e[type=mannequin,x=-85,y=62,z=2,dx=3,dy=4,dz=3] run say HOOKTEST common.intro_elder FAIL no mannequin at the elder spot
execute if block -67 64 0 minecraft:iron_bars run say HOOKTEST common.intro_door_closed PASS
execute unless block -67 64 0 minecraft:iron_bars run say HOOKTEST common.intro_door_closed FAIL door not closed after build
# 語りの途中(#t < 399)は標的が効かない。399 以降で撃てばハード(pick1)になり扉が開く
scoreboard players set #t hook.intro 100
execute as @n[type=marker,tag=hook.switch,tag=hook.intro,x=-80,y=66,z=-8,distance=..2] run function hook:intro/pick1
execute if score #chosen hook.diff matches 0 if block -67 64 0 minecraft:iron_bars run say HOOKTEST common.intro_early PASS
execute unless score #chosen hook.diff matches 0 run say HOOKTEST common.intro_early FAIL target worked before the story ended
scoreboard players set #t hook.intro 399
execute as @n[type=marker,tag=hook.switch,tag=hook.intro,x=-80,y=66,z=-8,distance=..2] run function hook:intro/pick1
execute if score #level hook.diff matches 1 if score #chosen hook.diff matches 1 if score #hp hook.diff matches 12 run say HOOKTEST common.intro_pick1 PASS
execute unless score #level hook.diff matches 1 run say HOOKTEST common.intro_pick1 FAIL target 2 did not set level 1
execute if block -67 64 0 minecraft:air run say HOOKTEST common.intro_door_open PASS
execute unless block -67 64 0 minecraft:air run say HOOKTEST common.intro_door_open FAIL door did not open after choosing
execute if data storage hook: guide{text:"扉をくぐって訓練場へ"} run say HOOKTEST common.intro_goal PASS
execute unless data storage hook: guide{text:"扉をくぐって訓練場へ"} run say HOOKTEST common.intro_goal FAIL goal not set to the door
execute as @n[type=marker,tag=hook.switch,tag=hook.intro,x=-75,y=66,z=-8,distance=..2] run function hook:intro/pick2
execute if score #level hook.diff matches 2 if score #fuel hook.cfg matches 20 run say HOOKTEST common.intro_pick2 PASS
execute unless score #level hook.diff matches 2 run say HOOKTEST common.intro_pick2 FAIL target 3 did not set level 2
execute as @n[type=marker,tag=hook.switch,tag=hook.intro,x=-85,y=66,z=-8,distance=..2] run function hook:intro/pick0
execute if score #level hook.diff matches 0 if score #fuel hook.cfg matches 40 run say HOOKTEST common.intro_pick0 PASS
execute unless score #level hook.diff matches 0 run say HOOKTEST common.intro_pick0 FAIL target 1 did not set level 0
function hook:diff/set {level:0}
scoreboard players set #chosen hook.diff 0
function hook:guide/clear
