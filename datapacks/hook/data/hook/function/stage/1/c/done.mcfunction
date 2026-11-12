#> hook:stage/1/c/done
# 的がひとつ作動した。3つで檻を開ける
scoreboard players add #cn hook.s1 1
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 1.5
tellraw @a[scores={hook.stage=1}] [{text:"的 ",color:"light_purple"},{score:{name:"#cn",objective:"hook.s1"},color:"white"},{text:"/3",color:"white"}]
execute if score #cn hook.s1 matches ..2 run return 0
execute in hook:world run fill 292 71 8 296 75 12 minecraft:air replace minecraft:iron_bars
execute in hook:world run summon item_display 294.5 72 10.5 {Tags:["hook.s1","hook.s1key"],billboard:"center",brightness:{sky:15,block:15},Glowing:1b,item:{id:"minecraft:amethyst_shard",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.2f,1.2f,1.2f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:block.iron_door.open master @s ~ ~ ~ 1 0.8
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"檻が開いた。水晶鍵を取れ。",color:"gray"}]
