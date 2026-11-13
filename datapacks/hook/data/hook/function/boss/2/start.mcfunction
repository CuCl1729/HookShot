#> hook:boss/2/start
# hook:world で実行。ボス戦開始: 入口を閉じ、番人とボスバーを出す
# 番人は移動速度 0(バニラの経路探索では動かない)。動くのはスクリプトの攻撃(tp)と、突き飛ばし(Motion)だけ
scoreboard players set #state hook.b2 1
# HP 3 + 難易度の加算(#boss_hp_add 0/1/2)。段階(部品を呼ぶ・突進が二連続)は残り HP 2・1 で変わる
scoreboard players set #hp hook.b2 3
execute if score #boss_hp_add hook.diff matches 1.. run scoreboard players operation #hp hook.b2 += #boss_hp_add hook.diff
scoreboard players set #inv hook.b2 0
scoreboard players set #act hook.b2 0
scoreboard players set #t hook.b2 0
scoreboard players set #n hook.b2 0
scoreboard players set #got hook.b2 0
scoreboard players set #w hook.b2 0
scoreboard players set #c2 hook.b2 2
scoreboard players set #c3 hook.b2 3
# 段階ごとの間合い(tick): #idle 行動の間 / #tel 突進の予告 / #ltel 跳躍の予告 / #dz 動けない時間(5 秒)。予告は難易度で縮む(hook:boss/2/pace)
scoreboard players set #idle hook.b2 50
scoreboard players set #tel hook.b2 30
scoreboard players set #ltel hook.b2 40
scoreboard players set #dz hook.b2 100
function hook:boss/2/pace
kill @e[tag=hook.boss2]
kill @e[tag=hook.b2m]
kill @e[tag=hook.s2bm]
kill @e[tag=hook.b2s]
fill 840 76 -1 842 79 1 minecraft:air
fill 819 64 -1 819 66 1 minecraft:iron_bars
summon zombie 852.5 64 0.5 {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss2"],PersistenceRequired:1b,Invulnerable:1b,Rotation:[90.0f,0.0f],CustomName:{text:"機巧の番人",color:"gold"},equipment:{mainhand:{id:"minecraft:iron_axe",count:1},head:{id:"minecraft:copper_helmet",count:1,components:{"minecraft:unbreakable":{}}},chest:{id:"minecraft:copper_chestplate",count:1},legs:{id:"minecraft:copper_leggings",count:1},feet:{id:"minecraft:copper_boots",count:1}},attributes:[{base:2.0,id:scale},{base:1,id:knockback_resistance},{base:0.0,id:movement_speed}]}
function hook:core/call {f:"hook:boss/2/bar_show"}
# 登場: 起動の轟音と火花(粒子と音だけ)
playsound minecraft:block.anvil.use hostile @a 841 70 0 3 0.5
playsound minecraft:entity.ravager.roar hostile @a 852 66 0 3 0.6
playsound minecraft:block.beacon.activate hostile @a 852 66 0 3 0.5
playsound minecraft:block.iron_door.close block @a 819 65 0 2 0.6
particle minecraft:explosion_emitter 852.5 66 0.5 0 0 0 0 1 force @a
particle minecraft:electric_spark 852.5 67 0.5 1.2 2 1.2 0.3 120 force @a
particle minecraft:large_smoke 852.5 65 0.5 2 0.5 2 0.08 80 force @a
particle minecraft:flame 852.5 64.2 0.5 3 0 3 0.02 40 force @a
title @a[scores={hook.stage=2}] times 10 50 15
title @a[scores={hook.stage=2}] title {text:"機巧の番人",color:"gold",bold:true}
title @a[scores={hook.stage=2}] subtitle {text:"壁際のプレスの下で潰せ",color:"gray"}
tellraw @a[scores={hook.stage=2}] [{text:"機巧の番人",color:"gold"},{text:"「侵入者。欠片ハ、渡サナイ」",color:"yellow"}]
