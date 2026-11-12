#> hook:boss/3/a_rain
# hook:world。虚の雨(第2形態): 1 で各プレイヤーの位置と、そこから斜め前後 5 マスほどに円(目印 hook.b3r)→ 1〜30 紫の円と光の柱(予告)
# → 31 で円の上下に虚が落ち、円の中(5x5、高さ -2〜+10)のプレイヤーに傷。フックで円の外へ出る
execute if score #t hook.b3 matches 1 run title @a[scores={hook.stage=4}] actionbar {text:"虚の雨 ― 紫の円から離れろ!",color:"light_purple"}
execute if score #t hook.b3 matches 1 at @a[scores={hook.stage=4}] run summon marker ~ ~ ~ {Tags:["hook.b3x","hook.b3r"]}
execute if score #t hook.b3 matches 1 at @a[scores={hook.stage=4}] run summon marker ~5 ~ ~-3 {Tags:["hook.b3x","hook.b3r"]}
execute if score #t hook.b3 matches 1 at @a[scores={hook.stage=4}] run summon marker ~-4 ~ ~4 {Tags:["hook.b3x","hook.b3r"]}
execute if score #t hook.b3 matches 1 at @e[tag=hook.boss3] run playsound minecraft:entity.evoker.prepare_attack hostile @a ~ ~ ~ 3 0.6
execute if score #t hook.b3 matches 1..30 at @e[tag=hook.b3r] run particle minecraft:portal ~ ~0.2 ~ 1.4 0.05 1.4 0 6 force @a
execute if score #t hook.b3 matches 1..30 at @e[tag=hook.b3r] run particle minecraft:end_rod ~ ~6 ~ 0.15 3 0.15 0 1 force @a
execute if score #t hook.b3 matches 22 at @e[tag=hook.b3r] run playsound minecraft:block.beacon.activate hostile @a ~ ~ ~ 1 1.6
execute unless score #t hook.b3 matches 31 run return 0
execute as @e[tag=hook.b3r] at @s run function hook:boss/3/rain_strike
function hook:boss/3/rest
