#> hook:stage/0/tick
# 誰かが訓練場(hook.stage=0)にいる間、毎 tick(core の tick から)
execute as @e[tag=hook.npc] at @s if entity @a[distance=..6] run rotate @s facing entity @p[distance=..6] eyes
# 師範の3マス以内に入るたびに話す(hook.near = 今そばにいる)
execute as @e[tag=hook.npc] at @s as @a[distance=..3,tag=!hook.near] run function hook:npc/interact
execute as @e[tag=hook.npc] at @s run tag @a[distance=..3] add hook.near
execute as @e[tag=hook.npc] at @s run tag @a[distance=4..] remove hook.near
execute as @a[scores={hook.stage=0}] at @s run function hook:stage/0/player
