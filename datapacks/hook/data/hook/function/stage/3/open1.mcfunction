#> hook:stage/3/open1
# @s = プレイヤー。稽古のゾンビ(スタン済み)が消えた → 環の島 R0 を出す
scoreboard players set #lesson hook.s3 2
execute in hook:world run function hook:stage/3/r0_blocks
execute in hook:world run particle minecraft:end_rod 1033.5 69 0.5 2 2 2 0.02 60 force @a
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1.4
tellraw @s {text:"風の環が現れた。環を撃って飛び移り、その先の広場へ渡ろう。",color:"gray"}
