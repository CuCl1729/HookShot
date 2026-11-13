#> hook:stage/5/shot
# @s = 欠片の標的のスイッチ(hook:hook/switch から。最後の一手)。欠片が鉤に引かれて手元へ飛んでくる(hook:stage/5/pull、tick 91〜115)
execute if score #shot hook.b3 matches 1 run return 0
scoreboard players set #shot hook.b3 1
kill @s
execute in hook:world run fill 1555 96 -1 1557 99 1 minecraft:air
execute in hook:world run summon item_display 1556.5 97.5 0.5 {Tags:["hook.s5f","hook.b3x"],billboard:"center",brightness:{sky:15,block:15},teleport_duration:2,Glowing:1b,glow_color_override:16766720,item:{id:"minecraft:glowstone",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[1.2f,1.2f,1.2f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}
execute in hook:world run particle minecraft:end_rod 1556.5 97.5 0.5 1 1 1 0.3 100 force @a
execute in hook:world run playsound minecraft:block.beacon.power_select master @a 1556 97 0 4 1.2
execute in hook:world run playsound minecraft:block.chain.break master @a 1556 97 0 4 0.8
