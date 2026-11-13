#> hook:stage/3/chase/start
# @s = 崩れ雲に立ったプレイヤー。崩落を始める(chase/step が数える)
scoreboard players set #chase hook.s3 1
playsound minecraft:block.wool.break block @s ~ ~ ~ 2 0.5
title @s actionbar {text:"雲が崩れ始めた! 赤くなった雲はすぐ落ちる",color:"red"}
function hook:guide/set {text:"雲を渡って南の島へ",x:1187.5,y:79,z:37.5}
execute if score #csk hook.s3 matches 1 run return 0
scoreboard players set #csk hook.s3 1
execute in hook:world positioned 1192.5 79 32.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
tellraw @s {text:"雲が崩れる! 先の島の射手に構わず、飛び続けよう。上の道でも下の道でも島へ届く。",color:"gray"}
