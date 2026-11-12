#> hook:hook/start_pull
# @s = プレイヤー。tag=hook.anchor の方へ引っ張り始める。hook.pull = 撃ってからの tick、hook.spd = いまの引きの速さ
tag @s add hook.pulling
scoreboard players set @s hook.pull 0
scoreboard players set @s hook.spd 0
scoreboard players set @s hook.stuck 0
scoreboard players set @s hook.hop 0
