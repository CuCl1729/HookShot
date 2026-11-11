#> hook:hook/yank
# @s = 軽い敵。#px/#py/#pz = プレイヤーの位置(×100)。プレイヤーの手前に落ちるよう Motion を与える
# (空中の水平減衰 0.91/tick で約 11 倍進むので、距離 / 14 で少し手前に落ちる)
execute store result score #yx hook.temporary run data get entity @s Pos[0] 100
execute store result score #yy hook.temporary run data get entity @s Pos[1] 100
execute store result score #yz hook.temporary run data get entity @s Pos[2] 100
scoreboard players operation #yx hook.temporary *= #-1 hook.constant
scoreboard players operation #yy hook.temporary *= #-1 hook.constant
scoreboard players operation #yz hook.temporary *= #-1 hook.constant
scoreboard players operation #yx hook.temporary += #px hook.temporary
scoreboard players operation #yy hook.temporary += #py hook.temporary
scoreboard players operation #yz hook.temporary += #pz hook.temporary
scoreboard players operation #yx hook.temporary /= #14 hook.constant
scoreboard players operation #yy hook.temporary /= #20 hook.constant
scoreboard players operation #yz hook.temporary /= #14 hook.constant
scoreboard players add #yy hook.temporary 45
execute store result entity @s Motion[0] double 0.01 run scoreboard players get #yx hook.temporary
execute store result entity @s Motion[1] double 0.01 run scoreboard players get #yy hook.temporary
execute store result entity @s Motion[2] double 0.01 run scoreboard players get #yz hook.temporary
