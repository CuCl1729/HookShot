#> hook:boss/2/defeat
# @s = 倒された番人。能力2を与えてステージ3へ
scoreboard players set #state hook.b2 2
function hook:core/call {f:"hook:boss/2/bar_hide"}
particle minecraft:explosion ~ ~1 ~ 1 1 1 0 20 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.7
kill @s
execute as @a[scores={hook.stage=2}] run function hook:boss/2/reward
