#> hook:stage/3/open1
# @s = プレイヤー。稽古のゾンビ(スタン済み)が消えた → 環の島 R0 を出す
scoreboard players set #lesson hook.s3 2
execute in hook:world run function hook:stage/3/r0_blocks
execute in hook:world run particle minecraft:end_rod 1033.5 69 0.5 2 2 2 0.02 60 force @a
playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1.4
playsound minecraft:entity.firework_rocket.twinkle master @s ~ ~ ~ 1 1.2
execute in hook:world run particle minecraft:firework 1033.5 69 0.5 3 3 3 0.05 50 force @a
function hook:guide/set {text:"環を撃って広場へ",x:1068.5,y:70,z:0.5}
function hook:fairy/say {text:"風の環だ！ 撃って飛び移ろう。ひとつ着いたら、すぐ次を狙うんだよ"}
tellraw @s {text:"風の環が現れた。環を撃って飛び移り、その先の広場へ渡ろう。",color:"gray"}
