#> hook:fairy/spawn
# 実行位置 = プレイヤー。ルミの表示エンティティ(item_display、tag hook.fairy)を肩の上に出す
summon item_display ~ ~1.9 ~ {Tags:["hook.fairy","hook.fairy_new"],billboard:"center",brightness:{sky:15,block:15},teleport_duration:3,Glowing:1b,glow_color_override:5636095,item:{id:"minecraft:glowstone_dust",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.25f,0.25f,0.25f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute as @e[type=item_display,tag=hook.fairy_new] run function hook:fairy/look
tag @e[tag=hook.fairy_new] remove hook.fairy_new
