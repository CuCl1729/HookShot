#> hook:stage/3/wave/spawn
scoreboard players set #ws hook.s3 1
execute if score #wave hook.s3 matches 1 run function hook:stage/3/wave/1
execute if score #wave hook.s3 matches 2 run function hook:stage/3/wave/2
execute if score #wave hook.s3 matches 3 run function hook:stage/3/wave/3
# 波の始まり: 島の中央に光の輪と角笛
execute as @a[scores={hook.stage=3}] at @s run playsound minecraft:entity.ravager.roar master @s ~ ~ ~ 0.8 1.3
execute as @a[scores={hook.stage=3}] at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 0.6
particle minecraft:explosion_emitter 1286 100 0 4 1 4 0 3 force @a
particle minecraft:end_rod 1286 100 0 5 1 5 0.1 80 force @a
title @a[scores={hook.stage=3}] times 5 30 10
title @a[scores={hook.stage=3}] title {text:""}
title @a[scores={hook.stage=3}] subtitle [{text:"番兵 ",color:"red"},{score:{name:"#wave",objective:"hook.s3"},color:"white"},{text:" / 3",color:"white"}]
scoreboard players operation #wg hook.s3 = #wave hook.s3
scoreboard players remove #wg hook.s3 1
execute store result storage hook: s3g.n int 1 run scoreboard players get #wg hook.s3
function hook:stage/3/wave/guide with storage hook: s3g
