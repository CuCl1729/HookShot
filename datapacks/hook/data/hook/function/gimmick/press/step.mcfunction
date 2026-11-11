#> hook:gimmick/press/step
# @s = 動作中のプレス marker(実行位置も)。2: 落とす / 3〜8: 下の敵を潰す / 60: 上げ始める / 80: 待機へ
scoreboard players add @s hook.press 1
execute if score @s hook.press matches 2 positioned ~-2.5 ~ ~-2.5 as @e[type=block_display,tag=hook.press_head,distance=..0.5] at @s run tp @s ~ ~-6 ~
execute if score @s hook.press matches 2 run playsound minecraft:block.piston.extend block @a ~ ~ ~ 2 0.5
execute if score @s hook.press matches 4 run playsound minecraft:block.anvil.land block @a ~ ~-6 ~ 2 0.6
execute if score @s hook.press matches 4 run particle minecraft:explosion ~ ~-5 ~ 1.5 0.2 1.5 0 6 force @a
execute if score @s hook.press matches 3..8 positioned ~-2.5 ~-6 ~-2.5 as @e[tag=hook.enemy,dx=4,dy=4,dz=4] at @s run function hook:enemy/kill
execute if score @s hook.press matches 60 positioned ~-2.5 ~-6 ~-2.5 as @e[type=block_display,tag=hook.press_head,distance=..0.5] run data modify entity @s teleport_duration set value 20
execute if score @s hook.press matches 60 positioned ~-2.5 ~-6 ~-2.5 as @e[type=block_display,tag=hook.press_head,distance=..0.5] at @s run tp @s ~ ~6 ~
execute if score @s hook.press matches 60 run playsound minecraft:block.piston.contract block @a ~ ~ ~ 1 0.5
execute if score @s hook.press matches 80.. positioned ~-2.5 ~ ~-2.5 as @e[type=block_display,tag=hook.press_head,distance=..0.5] run data modify entity @s teleport_duration set value 3
execute if score @s hook.press matches 80.. run scoreboard players set @s hook.press 0
