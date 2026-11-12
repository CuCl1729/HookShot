#> hook:boss/2/start
# hook:world で実行。ボス戦開始: 入口を閉じ、番人とボスバーを出す
# 番人は移動速度 0(バニラの経路探索では動かない)。動くのはスクリプトの攻撃(tp)と、突き飛ばし(Motion)だけ
scoreboard players set #state hook.b2 1
scoreboard players set #hp hook.b2 3
scoreboard players set #inv hook.b2 0
scoreboard players set #act hook.b2 0
scoreboard players set #t hook.b2 0
scoreboard players set #n hook.b2 0
scoreboard players set #c2 hook.b2 2
scoreboard players set #c3 hook.b2 3
# 段階ごとの間合い(tick): #idle 行動の間 / #tel 突進の予告 / #ltel 跳躍の予告 / #dz 動けない時間(5 秒)
scoreboard players set #idle hook.b2 50
scoreboard players set #tel hook.b2 30
scoreboard players set #ltel hook.b2 40
scoreboard players set #dz hook.b2 100
kill @e[tag=hook.boss2]
kill @e[tag=hook.b2m]
kill @e[tag=hook.s2bm]
fill 819 64 -1 819 66 1 minecraft:iron_bars
summon zombie 852.5 64 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss2"],PersistenceRequired:1b,Invulnerable:1b,Rotation:[90.0f,0.0f],CustomName:{text:"機巧の番人",color:"gold"},equipment:{mainhand:{id:"minecraft:iron_axe",count:1},head:{id:"minecraft:copper_helmet",count:1,components:{"minecraft:unbreakable":{}}},chest:{id:"minecraft:copper_chestplate",count:1},legs:{id:"minecraft:copper_leggings",count:1},feet:{id:"minecraft:copper_boots",count:1}},attributes:[{base:2.0,id:scale},{base:1,id:knockback_resistance},{base:0.0,id:movement_speed}]}
function hook:core/call {f:"hook:boss/2/bar_show"}
playsound minecraft:block.anvil.use hostile @a 841 70 0 3 0.5
title @a[scores={hook.stage=2}] times 10 50 15
title @a[scores={hook.stage=2}] title {text:"機巧の番人",color:"gold"}
title @a[scores={hook.stage=2}] subtitle {text:"壁際のプレスの下で潰せ",color:"gray"}
tellraw @a[scores={hook.stage=2}] [{text:"機巧の番人",color:"gold"},{text:"「侵入者。欠片ハ、渡サナイ」",color:"yellow"}]
