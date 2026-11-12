#> hook:boss/3/a_ring
# hook:world。虚の波: 1〜30 予告(王の足元に青い炎が渦巻く)→ 31 から王を中心に地面を這う輪が 1 ブロック/tick で 38 まで広がる。
# 輪に触れた接地中のプレイヤーに傷(跳ぶ・フックで宙にいれば当たらない)。第2形態は 20 tick 遅れてもう一重
execute if score #t hook.b3 matches 1 run title @a[scores={hook.stage=4}] actionbar {text:"虚の波 ― 地を這う輪が来る。跳んでかわせ!",color:"light_purple"}
execute if score #t hook.b3 matches 1 at @e[tag=hook.boss3] run playsound minecraft:block.respawn_anchor.charge hostile @a ~ ~ ~ 3 0.6
execute if score #t hook.b3 matches 1..30 at @e[tag=hook.boss3] run particle minecraft:end_rod ~ ~0.3 ~ 2.5 0 2.5 0.01 6 force @a
execute if score #t hook.b3 matches 15..30 at @e[tag=hook.boss3] run particle minecraft:reverse_portal ~ ~2 ~ 1 1.5 1 0.3 10 force @a
execute if score #t hook.b3 matches 31 at @e[tag=hook.boss3] run playsound minecraft:entity.wither.shoot hostile @a ~ ~ ~ 3 0.5
execute if score #t hook.b3 matches 51 if score #state hook.b3 matches 3 at @e[tag=hook.boss3] run playsound minecraft:entity.wither.shoot hostile @a ~ ~ ~ 3 0.7
scoreboard players operation #r hook.b3 = #t hook.b3
scoreboard players remove #r hook.b3 30
execute if score #r hook.b3 matches 1..38 run function hook:boss/3/ring_at
scoreboard players remove #r hook.b3 20
execute if score #state hook.b3 matches 3 if score #r hook.b3 matches 1..38 run function hook:boss/3/ring_at
execute if score #state hook.b3 matches 1 if score #t hook.b3 matches 70.. run function hook:boss/3/rest
execute if score #t hook.b3 matches 90.. run function hook:boss/3/rest
