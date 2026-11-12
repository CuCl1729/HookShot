#> hook:hook/ray
# @s = プレイヤー。実行位置 = 視線上の点。敵(当たり判定がこの点を含む)→ ブロック の順に調べ、無ければ 0.25 進める
# (test:npc/gaze/ray と同じ当たり判定のやり方)。通った所に鎖を描くので、外れても鎖が一瞬見える
execute positioned ~-0.99 ~-0.99 ~-0.99 as @e[tag=hook.enemy,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown,dx=0] positioned ~0.99 ~0.99 ~0.99 if entity @s[dx=0] run tag @s add hook.hit
execute if entity @e[tag=hook.hit,limit=1] run return run function hook:hook/hit_entity
execute unless block ~ ~ ~ #hook:pass run return run function hook:hook/hit_block
particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force @a
scoreboard players remove #ray hook.temporary 1
execute if score #ray hook.temporary matches 1.. positioned ^ ^ ^0.25 run function hook:hook/ray
