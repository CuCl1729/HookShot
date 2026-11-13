#> hook:stage/3/chase/tick
# in hook:world、#chase 1.. の間(gen3.mjs が生成)。番号 k の雲は 70k tick で赤くなり 70k+50 tick で崩れる(最初の崩落まで 6 秒、1 跳び 3.5 秒)
execute if score #chase hook.s3 matches 70 run fill 1102 70 18 1106 70 22 minecraft:red_wool replace minecraft:white_wool
execute if score #chase hook.s3 matches 70 run playsound minecraft:block.wool.break block @a 1104 70 20 2 0.6
execute if score #chase hook.s3 matches 120 run fill 1102 68 18 1106 70 22 minecraft:air
execute if score #chase hook.s3 matches 120 run particle minecraft:cloud 1104 70 20 1.5 0.3 1.5 0.02 40 force @a
execute if score #chase hook.s3 matches 120 run playsound minecraft:block.wool.break block @a 1104 70 20 3 0.5
execute if score #chase hook.s3 matches 140 run fill 1118 73 28 1122 73 32 minecraft:red_wool replace minecraft:white_wool
execute if score #chase hook.s3 matches 140 run playsound minecraft:block.wool.break block @a 1120 73 30 2 0.6
execute if score #chase hook.s3 matches 190 run fill 1118 71 28 1122 73 32 minecraft:air
execute if score #chase hook.s3 matches 190 run particle minecraft:cloud 1120 73 30 1.5 0.3 1.5 0.02 40 force @a
execute if score #chase hook.s3 matches 190 run playsound minecraft:block.wool.break block @a 1120 73 30 3 0.5
execute if score #chase hook.s3 matches 210 run fill 1134 74 38 1138 74 42 minecraft:red_wool replace minecraft:white_wool
execute if score #chase hook.s3 matches 210 run playsound minecraft:block.wool.break block @a 1136 74 40 2 0.6
execute if score #chase hook.s3 matches 260 run fill 1134 72 38 1138 74 42 minecraft:air
execute if score #chase hook.s3 matches 260 run particle minecraft:cloud 1136 74 40 1.5 0.3 1.5 0.02 40 force @a
execute if score #chase hook.s3 matches 260 run playsound minecraft:block.wool.break block @a 1136 74 40 3 0.5
execute if score #chase hook.s3 matches 280 run fill 1148 82 26 1152 82 30 minecraft:red_wool replace minecraft:white_wool
execute if score #chase hook.s3 matches 280 run playsound minecraft:block.wool.break block @a 1150 82 28 2 0.6
execute if score #chase hook.s3 matches 330 run fill 1148 80 26 1152 82 30 minecraft:air
execute if score #chase hook.s3 matches 330 run particle minecraft:cloud 1150 82 28 1.5 0.3 1.5 0.02 40 force @a
execute if score #chase hook.s3 matches 330 run playsound minecraft:block.wool.break block @a 1150 82 28 3 0.5
execute if score #chase hook.s3 matches 280 run fill 1150 68 40 1154 68 44 minecraft:red_wool replace minecraft:white_wool
execute if score #chase hook.s3 matches 280 run playsound minecraft:block.wool.break block @a 1152 68 42 2 0.6
execute if score #chase hook.s3 matches 330 run fill 1150 66 40 1154 68 44 minecraft:air
execute if score #chase hook.s3 matches 330 run particle minecraft:cloud 1152 68 42 1.5 0.3 1.5 0.02 40 force @a
execute if score #chase hook.s3 matches 330 run playsound minecraft:block.wool.break block @a 1152 68 42 3 0.5
execute if score #chase hook.s3 matches 350 run fill 1165 84 22 1169 84 26 minecraft:red_wool replace minecraft:white_wool
execute if score #chase hook.s3 matches 350 run playsound minecraft:block.wool.break block @a 1167 84 24 2 0.6
execute if score #chase hook.s3 matches 400 run fill 1165 82 22 1169 84 26 minecraft:air
execute if score #chase hook.s3 matches 400 run particle minecraft:cloud 1167 84 24 1.5 0.3 1.5 0.02 40 force @a
execute if score #chase hook.s3 matches 400 run playsound minecraft:block.wool.break block @a 1167 84 24 3 0.5
execute if score #chase hook.s3 matches 350 run fill 1166 66 42 1170 66 46 minecraft:red_wool replace minecraft:white_wool
execute if score #chase hook.s3 matches 350 run playsound minecraft:block.wool.break block @a 1168 66 44 2 0.6
execute if score #chase hook.s3 matches 400 run fill 1166 64 42 1170 66 46 minecraft:air
execute if score #chase hook.s3 matches 400 run particle minecraft:cloud 1168 66 44 1.5 0.3 1.5 0.02 40 force @a
execute if score #chase hook.s3 matches 400 run playsound minecraft:block.wool.break block @a 1168 66 44 3 0.5
