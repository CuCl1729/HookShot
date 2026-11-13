#> hook:stage/5/altar
# 妖精の村の祭壇(-91 63 0)に太陽石が戻る。tag hook.intro なので core/reset(intro/build)が片付ける
execute in hook:world run kill @e[type=item_display,tag=hook.s5sun]
execute in hook:world run setblock -91 64 0 minecraft:air
execute in hook:world run setblock -90 66 0 minecraft:light[level=15]
execute in hook:world run summon item_display -90.5 65.4 0.5 {Tags:["hook.intro","hook.s5sun"],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,glow_color_override:16766720,item:{id:"minecraft:glowstone",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.4f,1.4f,1.4f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute in hook:world run particle minecraft:end_rod -90.5 65.4 0.5 2 2 2 0.15 150 force @a
execute in hook:world run particle minecraft:totem_of_undying -90.5 65.4 0.5 1 1 1 0.5 100 force @a
execute in hook:world run playsound minecraft:block.beacon.activate master @a -90 65 0 3 0.8
execute in hook:world run playsound minecraft:block.end_portal.spawn master @a -90 65 0 2 1.4
title @a[scores={hook.stage=5}] times 10 50 20
title @a[scores={hook.stage=5}] subtitle {text:"祭壇に、太陽石が戻った",color:"yellow"}
title @a[scores={hook.stage=5}] title {text:"",color:"white"}
