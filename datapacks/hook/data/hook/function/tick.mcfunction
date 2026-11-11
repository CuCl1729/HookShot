#> hook:tick
scoreboard players add #tick hook.temporary 1
execute if score #tick hook.temporary matches 100.. run scoreboard players set #tick hook.temporary 0

execute as @a unless score @s hook.joined matches 1 run function hook:player/join
# 死亡からの復帰(@e[type=player] は生きているプレイヤーだけ。immediate_respawn なのですぐ戻る)
execute as @e[type=player,scores={hook.death=1..}] run function hook:cp/return
execute as @a at @s run function hook:player/tick
execute as @e[tag=hook.enemy] at @s run function hook:enemy/tick

execute unless data storage hook: built{s0:1b} run function hook:stage/0/build

execute if entity @a[scores={hook.stage=0}] run function hook:stage/0/tick
execute if entity @a[scores={hook.stage=1}] run function hook:stage/1/tick
execute if entity @a[scores={hook.stage=2}] run function hook:stage/2/tick
execute if entity @a[scores={hook.stage=3}] run function hook:stage/3/tick
execute if entity @a[scores={hook.stage=4}] run function hook:stage/4/tick
execute if entity @a[scores={hook.stage=5}] run function hook:stage/5/tick

# hook:enemy/summon/* が付けた目印は、呼んだ側がその tick 中に使い終わっている
tag @e[tag=hook.new] remove hook.new
