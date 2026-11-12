#> hook:boss/3/a_call
# hook:world。手下を呼ぶ: 1 で王の左右 3 マスに出現点(目印 hook.b3s。床が無い・塞がっていれば王の足元)→ 1〜30 紫の渦(予告)
# → 30 でゾンビと爆弾兵を1体ずつ(第1形態は手下 4 体、第2形態は 3 体以上いれば呼ばない)。手下は投げて王を怯ませる弾
execute if score #t hook.b3 matches 1 run title @a[scores={hook.stage=4}] actionbar {text:"虚の王が抜け殻を呼ぶ ― 掴んで王に投げつけろ!",color:"light_purple"}
execute if score #t hook.b3 matches 1 as @e[tag=hook.boss3] at @s rotated ~ 0 positioned ^3 ^ ^ run function hook:boss/3/call_spot
execute if score #t hook.b3 matches 1 run tag @e[tag=hook.b3new] add hook.b3z
execute if score #t hook.b3 matches 1 run tag @e[tag=hook.b3new] remove hook.b3new
execute if score #t hook.b3 matches 1 as @e[tag=hook.boss3] at @s rotated ~ 0 positioned ^-3 ^ ^ run function hook:boss/3/call_spot
execute if score #t hook.b3 matches 1 at @e[tag=hook.boss3] run playsound minecraft:entity.evoker.prepare_summon hostile @a ~ ~ ~ 2 0.8
execute if score #t hook.b3 matches 1..30 at @e[tag=hook.b3s] run particle minecraft:portal ~ ~1 ~ 0.3 0.8 0.3 0.6 10 force @a
execute if score #t hook.b3 matches 1..30 at @e[tag=hook.b3s] run particle minecraft:portal ~ ~0.2 ~ 0.4 0 0.4 0 2 force @a
execute unless score #t hook.b3 matches 30 run return 0
execute store result score #n hook.b3 if entity @e[tag=hook.b3m]
execute if score #state hook.b3 matches 1 if score #n hook.b3 matches 4.. run return run function hook:boss/3/rest
execute if score #state hook.b3 matches 3 if score #n hook.b3 matches 3.. run return run function hook:boss/3/rest
execute at @n[tag=hook.b3z] run function hook:enemy/summon/zombie
execute at @n[tag=hook.b3s,tag=!hook.b3z] run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s4
tag @e[tag=hook.new] add hook.b3m
execute at @e[tag=hook.b3s] run particle minecraft:large_smoke ~ ~1 ~ 0.4 0.6 0.4 0.05 15 force @a
execute at @e[tag=hook.boss3] run playsound minecraft:entity.evoker.cast_spell hostile @a ~ ~ ~ 2 0.8
function hook:boss/3/rest
