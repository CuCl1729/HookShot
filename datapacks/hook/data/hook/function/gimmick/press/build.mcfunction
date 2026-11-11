#> hook:gimmick/press/build
# 実行位置 = 範囲の床の上のブロックの角(align 済み)。hook:gimmick/press/place から
# 古いもの(marker・頭は上下どちらにあっても)を消して置き直す
execute positioned ~0.5 ~6 ~0.5 run kill @e[type=marker,tag=hook.press,distance=..0.5]
execute positioned ~-2 ~6 ~-2 run kill @e[type=block_display,tag=hook.press_head,distance=..0.5]
execute positioned ~-2 ~ ~-2 run kill @e[type=block_display,tag=hook.press_head,distance=..0.5]
execute positioned ~-2.5 ~7.5 ~-2.5 run kill @e[type=marker,tag=hook.switch,distance=..0.5]
execute positioned ~3.5 ~7.5 ~-2.5 run kill @e[type=marker,tag=hook.switch,distance=..0.5]
execute positioned ~-2.5 ~7.5 ~3.5 run kill @e[type=marker,tag=hook.switch,distance=..0.5]
execute positioned ~3.5 ~7.5 ~3.5 run kill @e[type=marker,tag=hook.switch,distance=..0.5]
fill ~-3 ~8 ~-3 ~3 ~8 ~3 minecraft:iron_block
fill ~ ~9 ~ ~ ~12 ~ minecraft:iron_chain
setblock ~-3 ~7 ~-3 minecraft:target
setblock ~3 ~7 ~-3 minecraft:target
setblock ~-3 ~7 ~3 minecraft:target
setblock ~3 ~7 ~3 minecraft:target
summon marker ~-2.5 ~7.5 ~-2.5 {Tags:["hook.switch"],data:{f:"hook:gimmick/press/drop"}}
summon marker ~3.5 ~7.5 ~-2.5 {Tags:["hook.switch"],data:{f:"hook:gimmick/press/drop"}}
summon marker ~-2.5 ~7.5 ~3.5 {Tags:["hook.switch"],data:{f:"hook:gimmick/press/drop"}}
summon marker ~3.5 ~7.5 ~3.5 {Tags:["hook.switch"],data:{f:"hook:gimmick/press/drop"}}
# 本体 = 頭の上がった位置(範囲中心の 6 上)の marker。hook.press = 動作の経過 tick(0 = 待機)
summon marker ~0.5 ~6 ~0.5 {Tags:["hook.press"]}
execute positioned ~0.5 ~6 ~0.5 run scoreboard players set @e[type=marker,tag=hook.press,distance=..0.5] hook.press 0
summon block_display ~-2 ~6 ~-2 {Tags:["hook.press_head"],block_state:{id:"minecraft:iron_block"},teleport_duration:3,transformation:{translation:[0.0f,0.0f,0.0f],scale:[5.0f,2.0f,5.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
