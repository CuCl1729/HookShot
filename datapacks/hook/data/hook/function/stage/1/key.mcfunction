#> hook:stage/1/key
# @s = プレイヤーが 2.5 以内に来た水晶鍵(item_display、実行位置も @s)。tag hook.s1ka/kb/kc でどこの鍵か分かる
tag @s remove hook.s1key
scoreboard players add #keys hook.s1 1
execute if entity @s[tag=hook.s1ka] run scoreboard players set #ka hook.s1 1
execute if entity @s[tag=hook.s1kb] run scoreboard players set #kb hook.s1 1
execute if entity @s[tag=hook.s1kc] run scoreboard players set #kc hook.s1 1
particle minecraft:end_rod ~ ~0.3 ~ 0.4 0.4 0.4 0.15 60 force @a
particle minecraft:totem_of_undying ~ ~0.3 ~ 0.5 0.5 0.5 0.4 50 force @a
particle minecraft:firework ~ ~0.3 ~ 0.2 0.2 0.2 0.2 30 force @a
playsound minecraft:block.amethyst_block.resonate master @a ~ ~ ~ 1 1.2
playsound minecraft:block.amethyst_block.chime master @a ~ ~ ~ 1.5 1.6
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 0.6 1.4
playsound minecraft:entity.firework_rocket.twinkle master @a ~ ~ ~ 1 1.2
title @a[scores={hook.stage=1}] times 5 40 10
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle [{text:"水晶鍵 ",color:"light_purple"},{score:{name:"#keys",objective:"hook.s1"},color:"white"},{text:"/3",color:"white"}]
tellraw @a[scores={hook.stage=1}] [{text:"水晶鍵 ",color:"light_purple"},{score:{name:"#keys",objective:"hook.s1"},color:"white"},{text:"/3",color:"white"}]
execute if score #keys hook.s1 matches 1 run function hook:fairy/say {text:"ひとつ目の鍵！ 冷たくてきれいだね"}
execute if score #keys hook.s1 matches 2 run function hook:fairy/say {text:"あとひとつ！"}
execute if score #keys hook.s1 matches ..2 run function hook:stage/1/goal
kill @s
