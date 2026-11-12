#> hook:boss/3/a_dash
# hook:world。虚の突撃(第1形態): 1 でいちばん近いプレイヤーの方向を固定(目印 hook.b3dir)→ 1〜30 その方向に炎の線を引く(予告)
# → 31〜60 線の上を 1.2 ブロック/tick で突進(壁・柱・トゲの手前で止まる)。触れたプレイヤーに傷。柱の陰に入るか横へ逃げる
execute if score #t hook.b3 matches 1 run title @a[scores={hook.stage=4}] actionbar {text:"虚の突撃 ― 炎の線から外れろ!",color:"light_purple"}
execute if score #t hook.b3 matches 1 as @e[tag=hook.boss3] at @s facing entity @p[scores={hook.stage=4}] feet rotated ~ 0 run function hook:boss/3/dash_aim
scoreboard players operation #m hook.b3 = #t hook.b3
scoreboard players operation #m hook.b3 %= #4 hook.constant
execute if score #t hook.b3 matches 1..30 if score #m hook.b3 matches 1 as @e[tag=hook.boss3] at @s rotated as @n[tag=hook.b3dir] run function hook:boss/3/dash_line_start
execute if score #t hook.b3 matches 31 at @e[tag=hook.boss3] run playsound minecraft:entity.wither.shoot hostile @a ~ ~ ~ 3 0.5
execute if score #t hook.b3 matches 31..60 as @e[tag=hook.boss3] at @s rotated as @n[tag=hook.b3dir] run function hook:boss/3/dash_step
execute if score #t hook.b3 matches 61.. run function hook:boss/3/rest
