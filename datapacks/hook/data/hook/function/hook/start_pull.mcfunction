#> hook:hook/start_pull
# @s = プレイヤー。tag=hook.anchor の方へ引っ張り始める(最大 40 tick)
tag @s add hook.pulling
scoreboard players set @s hook.pull 40
execute store result score @s hook.px run data get entity @s Pos[0] 100
execute store result score @s hook.py run data get entity @s Pos[1] 100
execute store result score @s hook.pz run data get entity @s Pos[2] 100
