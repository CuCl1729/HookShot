#> hook:stage/2/a/fuse
# @s = 導火線に点火した A のプレス marker(実行位置 = 頭の上がった位置、範囲の床の 6 上)。0 になったら落とす(hook.press = 1 で gimmick/press が落とす)
scoreboard players remove @s hook.s2 1
particle minecraft:smoke ~ ~1.5 ~ 2 0.2 2 0 6 force @a
# 範囲の床に印(どこに落ちるか)
particle minecraft:flame ~ ~-5.9 ~ 2 0 2 0 4 force @a
execute if score @s hook.s2 matches 20 run playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1.5 1
execute if score @s hook.s2 matches 0 run playsound minecraft:block.note_block.pling block @a ~ ~ ~ 1.5 2
execute if score @s hook.s2 matches 0 if score @s hook.press matches 0 run scoreboard players set @s hook.press 1
