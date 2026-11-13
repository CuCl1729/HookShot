#> hook:stage/3/wave/clear
# in hook:world。今の波が全滅した
scoreboard players set #ws hook.s3 0
scoreboard players add #wave hook.s3 1
scoreboard players set #wt hook.s3 60
playsound minecraft:entity.player.levelup master @a 1286 100 0 3 1.2
particle minecraft:firework 1286 100 0 5 2 5 0.1 80 force @a
particle minecraft:totem_of_undying 1286 100 0 3 2 3 0.3 40 force @a
execute if score #wave hook.s3 matches 2..3 run function hook:fairy/say {text:"一波、落としたね！ 次が来るよ"}
execute if score #wave hook.s3 matches 4 run function hook:stage/3/wave/open
