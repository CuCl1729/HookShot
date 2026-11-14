scoreboard players set #rdyg hook.temporary 1
say HOOKTEST gimmick.chunks PASS
fill 3035 63 2995 3095 63 3010 minecraft:stone
fill 3035 64 2995 3095 82 3010 minecraft:air
kill @e[type=!player,x=3035,y=60,z=2995,dx=60,dy=30,dz=15]
scoreboard players set #t hook.temporary 0
kill @e[type=marker,tag=hooktest.probe]
# トゲ: Z1 = フックで動かした直後(hook.mv>0)→ 死ぬ / Z2 = 素通り(mv なし)→ 生きる
setblock 3040 64 3000 minecraft:amethyst_cluster
setblock 3040 64 3005 minecraft:amethyst_cluster
execute positioned 3040.5 64 3000.5 run function hook:enemy/summon/zombie
execute positioned 3040.5 64 3000.5 run data modify entity @n[tag=hook.new] NoAI set value 1b
execute positioned 3040.5 64 3000.5 run tag @n[tag=hook.new] add hooktest.spike_mv
execute positioned 3040.5 64 3000.5 run scoreboard players set @n[tag=hook.new] hook.mv 100
execute positioned 3040.5 64 3005.5 run function hook:enemy/summon/zombie
execute positioned 3040.5 64 3005.5 run data modify entity @n[tag=hook.new] NoAI set value 1b
execute positioned 3040.5 64 3005.5 run tag @n[tag=hook.new] add hooktest.spike_idle
# プレス機(下の敵は mv に関係なく潰れる): 範囲の床の上に置く(実行位置 = 3080 64 3000)。範囲内に P1 = mv あり / P2 = mv なし(自分で歩いて入った)
execute positioned 3080 64 3000 run function hook:gimmick/press/place
execute positioned 3079.5 64 3000.5 run function hook:enemy/summon/zombie
execute positioned 3079.5 64 3000.5 run data modify entity @n[tag=hook.new] NoAI set value 1b
execute positioned 3079.5 64 3000.5 run tag @n[tag=hook.new] add hooktest.press_mv
execute positioned 3079.5 64 3000.5 run scoreboard players set @n[tag=hook.new] hook.mv 100
execute positioned 3081.5 64 3002.5 run function hook:enemy/summon/zombie
execute positioned 3081.5 64 3002.5 run data modify entity @n[tag=hook.new] NoAI set value 1b
execute positioned 3081.5 64 3002.5 run tag @n[tag=hook.new] add hooktest.press_walked
# Q(3065): 運んで放してから 60 tick 以上たってから落とす(loop の #t 65)
execute positioned 3065 64 3000 run function hook:gimmick/press/place
execute positioned 3065.5 64 3000.5 run function hook:enemy/summon/zombie
execute positioned 3065.5 64 3000.5 run data modify entity @n[tag=hook.new] NoAI set value 1b
execute positioned 3065.5 64 3000.5 run tag @n[tag=hook.new] add hooktest.press_stale
execute positioned 3065.5 64 3000.5 run scoreboard players set @n[tag=hook.new] hook.mv 60
# R(3050): ステージ2 A ラインと同じ導火線(stage/2/a/arm → 40 tick 後に落ちる)。敵は点火の直前に動かした(mv 30、落ちる前に切れる)
execute positioned 3050 64 3000 run function hook:gimmick/press/place
execute positioned 3050.5 64 3000.5 run function hook:enemy/summon/zombie
execute positioned 3050.5 64 3000.5 run data modify entity @n[tag=hook.new] NoAI set value 1b
execute positioned 3050.5 64 3000.5 run tag @n[tag=hook.new] add hooktest.press_fuse
execute positioned 3050.5 64 3000.5 run scoreboard players set @n[tag=hook.new] hook.mv 30
execute positioned 3047.5 71.5 2997.5 as @e[type=marker,tag=hook.switch,distance=..0.5] at @s run function hook:stage/2/a/arm
# 標的(南西)を撃ったことにして drop を呼ぶ。その後 press/tick を毎 tick 呼ぶ(各ステージの tick の代わり)
execute positioned 3077.5 71.5 2997.5 as @e[type=marker,tag=hook.switch,distance=..0.5] at @s run function hook:gimmick/press/drop
execute if entity @e[type=marker,tag=hook.press,scores={hook.press=1}] run say HOOKTEST gimmick.press_triggered PASS
execute unless entity @e[type=marker,tag=hook.press,scores={hook.press=1}] run say HOOKTEST gimmick.press_triggered FAIL switch did not start the press
execute if block 3077 71 2997 minecraft:target if block 3080 72 3000 minecraft:iron_block run say HOOKTEST gimmick.press_built PASS
execute unless block 3077 71 2997 minecraft:target run say HOOKTEST gimmick.press_built FAIL target missing
schedule function hooktest:gimmick/loop 1t
execute as @e[type=marker,tag=hook.press] run scoreboard players get @s hook.press
execute store result score #n hook.temporary if entity @e[tag=hook.press]
