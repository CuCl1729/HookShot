#> hook:stage/1/b/clear
# 3波を倒した(in hook:world)。格子を開け、中央の柱の上に水晶鍵
fill 226 71 28 234 76 28 minecraft:air
summon item_display 230.5 83.5 45.5 {Tags:["hook.s1","hook.s1key","hook.s1kb"],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,item:{id:"minecraft:amethyst_shard",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.2f,1.2f,1.2f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
particle minecraft:end_rod 230.5 84 45.5 0.3 0.5 0.3 0.1 60 force @a
particle minecraft:totem_of_undying 230.5 76 45.5 8 3 8 0.3 150 force @a
particle minecraft:firework 230.5 80 45.5 4 2 4 0.1 80 force @a
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:block.iron_door.open master @s ~ ~ ~ 1 0.8
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:entity.firework_rocket.blast master @s ~ ~ ~ 1 1
title @a[scores={hook.stage=1}] times 5 40 10
title @a[scores={hook.stage=1}] title {text:"広間制圧",color:"gold",bold:true}
title @a[scores={hook.stage=1}] subtitle {text:"中央の柱の上に水晶鍵",color:"light_purple"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"広間を制した。中央の柱の上に水晶鍵が現れた。",color:"gray"}]
function hook:guide/set {text:"柱の上の水晶鍵を取る",x:230,y:83,z:45}
