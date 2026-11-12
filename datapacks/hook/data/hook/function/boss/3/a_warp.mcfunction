#> hook:boss/3/a_warp
# hook:world。虚渡り(第2形態): 1 で行き先の島を選ぶ(目印 hook.b3w)→ 1〜30 行き先に紫の柱(予告)→ 30 で王が渡る。
# 行き先: C 玉座の島 / S1・S2 トゲの縁 / P1・P2 プレスの真下 / T 玉座(トゲ・プレスの島に来たら縛って押し込む好機)
execute if score #t hook.b3 matches 1 run function hook:core/call {f:"hook:boss/3/roll"}
execute if score #t hook.b3 matches 1 run scoreboard players set #k hook.b3 6
execute if score #t hook.b3 matches 1 run scoreboard players operation #r hook.b3 %= #k hook.b3
execute if score #t hook.b3 matches 1 if score #r hook.b3 matches 0 run summon marker 1550.5 64 0.5 {Tags:["hook.b3x","hook.b3w"]}
execute if score #t hook.b3 matches 1 if score #r hook.b3 matches 1 run summon marker 1531.5 64 -10.5 {Tags:["hook.b3x","hook.b3w"]}
execute if score #t hook.b3 matches 1 if score #r hook.b3 matches 2 run summon marker 1568.5 64 10.5 {Tags:["hook.b3x","hook.b3w"]}
execute if score #t hook.b3 matches 1 if score #r hook.b3 matches 3 run summon marker 1537.5 64 11.5 {Tags:["hook.b3x","hook.b3w"]}
execute if score #t hook.b3 matches 1 if score #r hook.b3 matches 4 run summon marker 1563.5 64 -10.5 {Tags:["hook.b3x","hook.b3w"]}
execute if score #t hook.b3 matches 1 if score #r hook.b3 matches 5.. run summon marker 1581.5 64 0.5 {Tags:["hook.b3x","hook.b3w"]}
execute if score #t hook.b3 matches 1 as @e[tag=hook.b3w] at @s if entity @e[tag=hook.boss3,distance=..5] run function hook:boss/3/warp_alt
execute if score #t hook.b3 matches 1 run title @a[scores={hook.stage=4}] actionbar {text:"虚渡り ― 紫の柱の島へ王が渡る",color:"light_purple"}
execute if score #t hook.b3 matches 1 at @e[tag=hook.b3w] run playsound minecraft:block.portal.trigger hostile @a ~ ~ ~ 2 1.6
execute if score #t hook.b3 matches 1..30 at @e[tag=hook.b3w] run particle minecraft:reverse_portal ~ ~1.5 ~ 0.4 1.5 0.4 0.2 14 force @a
execute if score #t hook.b3 matches 1..30 at @e[tag=hook.boss3] run particle minecraft:portal ~ ~2 ~ 0.6 1 0.6 0.5 8 force @a
execute unless score #t hook.b3 matches 30 run return 0
execute at @e[tag=hook.boss3] run particle minecraft:large_smoke ~ ~1 ~ 0.5 1 0.5 0.05 30 force @a
execute as @e[tag=hook.boss3] at @n[tag=hook.b3w] run tp @s ~ ~ ~
execute as @e[tag=hook.boss3] run data modify entity @s Motion set value [0.0d,0.0d,0.0d]
execute at @e[tag=hook.boss3] run particle minecraft:reverse_portal ~ ~1 ~ 0.5 1 0.5 0.5 60 force @a
execute at @e[tag=hook.boss3] run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 2 0.5
function hook:boss/3/rest
