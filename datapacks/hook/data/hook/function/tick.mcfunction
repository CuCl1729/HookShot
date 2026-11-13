#> hook:tick
scoreboard players add #tick hook.temporary 1
execute if score #tick hook.temporary matches 100.. run scoreboard players set #tick hook.temporary 0

execute as @a unless score @s hook.joined matches 1 run function hook:player/join
# 死亡からの復帰(@e[type=player] は生きているプレイヤーだけ。immediate_respawn なのですぐ戻る)。数えて演出(player/died が cp/return を呼ぶ)
execute as @e[type=player,scores={hook.death=1..}] run function hook:player/died
execute as @a at @s run function hook:player/tick
# ルミ(hook:fairy/*)
execute as @a[tag=hook.lumi] at @s run function hook:fairy/tick
execute as @e[tag=hook.enemy] at @s run function hook:enemy/tick
execute as @e[type=marker,tag=hook.proj] at @s run function hook:combat/proj_tick
function hook:score/tick

execute unless data storage hook: built{s0:1b} run function hook:stage/0/build

# 導入(妖精の村。hook.stage -1)
execute if entity @a[scores={hook.stage=-1}] unless data storage hook: built{intro:1b} run function hook:intro/build
execute if entity @a[scores={hook.stage=-1}] run function hook:intro/tick
execute if entity @a[scores={hook.stage=0}] run function hook:stage/0/tick
execute if entity @a[scores={hook.stage=1}] run function hook:stage/1/tick
execute if entity @a[scores={hook.stage=2}] run function hook:stage/2/tick
execute if entity @a[scores={hook.stage=3}] run function hook:stage/3/tick
execute if entity @a[scores={hook.stage=4}] run function hook:stage/4/tick
execute if entity @a[scores={hook.stage=5}] run function hook:stage/5/tick

# 開発用 inbox(tools/mcrun.mjs)。#inbox hook.dev が 1 のときだけ
execute if score #inbox hook.dev matches 1 run function hook:dev/inbox_tick

# 難易度: 出たばかりの雑魚に移動速度の加算(modifier hook:diff)
execute if score #spd hook.diff matches 1.. as @e[tag=hook.new,tag=hook.enemy,tag=!hook.boss] run function hook:diff/enemy
# hook:enemy/summon/* が付けた目印は、呼んだ側がその tick 中に使い終わっている
tag @e[tag=hook.new] remove hook.new
