#> hook:enemy/tick
# @s = 敵(実行位置も @s)。トゲ床・奈落で死ぬ。スタンの残りを減らす
execute if block ~ ~ ~ minecraft:amethyst_cluster run return run function hook:enemy/kill
execute store result score @s hook.y run data get entity @s Pos[1]
execute if score @s hook.y matches ..31 run return run function hook:enemy/kill
execute if score @s hook.stun matches 1.. run function hook:enemy/stun_tick
