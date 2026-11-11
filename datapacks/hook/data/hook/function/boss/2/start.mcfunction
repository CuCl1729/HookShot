#> hook:boss/2/start
# hook:world で実行。ボス戦開始: 入口を閉じ、番人とボスバーを出す
scoreboard players set #state hook.b2 1
scoreboard players set #hp hook.b2 3
scoreboard players set #inv hook.b2 0
kill @e[tag=hook.boss2]
fill 819 76 -1 819 78 1 minecraft:iron_bars
summon zombie 852.5 76 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss2"],PersistenceRequired:1b,Invulnerable:1b,CustomName:{text:"機巧の番人",color:"gold"},equipment:{mainhand:{id:"minecraft:iron_axe",count:1},head:{id:"minecraft:copper_helmet",count:1,components:{"minecraft:unbreakable":{}}},chest:{id:"minecraft:copper_chestplate",count:1},legs:{id:"minecraft:copper_leggings",count:1},feet:{id:"minecraft:copper_boots",count:1}},attributes:[{base:2.0,id:scale},{base:1,id:knockback_resistance}]}
function hook:core/call {f:"hook:boss/2/bar_show"}
playsound minecraft:block.anvil.use hostile @a 841 80 0 3 0.5
title @a[scores={hook.stage=2}] title {text:"機巧の番人",color:"gold"}
title @a[scores={hook.stage=2}] subtitle {text:"壁際のプレスへ突き飛ばせ",color:"gray"}
