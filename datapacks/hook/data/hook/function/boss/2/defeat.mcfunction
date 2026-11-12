#> hook:boss/2/defeat
# @s = 倒された番人。能力2を与え、評価を出してからステージ3へ(hook:boss/2/post)
scoreboard players set #state hook.b2 2
scoreboard players set #t hook.b2 0
function hook:core/call {f:"hook:boss/2/bar_hide"}
particle minecraft:explosion ~ ~1 ~ 1 1 1 0 20 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.7
kill @e[tag=hook.b2m]
kill @e[tag=hook.s2bm]
kill @s
function hook:score/stop
execute as @a[scores={hook.stage=2}] run function hook:boss/2/reward
