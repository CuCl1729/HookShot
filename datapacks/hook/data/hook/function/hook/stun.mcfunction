#> hook:hook/stun
# @s = 敵。3秒スタン(tag hook.stun、スコア hook.stun = 残り tick。hook:enemy/tick が減らして外す)
effect give @s minecraft:slowness 3 255 true
effect give @s minecraft:weakness 3 255 true
tag @s add hook.stun
scoreboard players set @s hook.stun 60
