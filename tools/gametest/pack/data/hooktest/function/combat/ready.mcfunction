scoreboard players set #rdyc hook.temporary 1
say HOOKTEST combat.chunks PASS
kill @e[type=marker,tag=hooktest.probe]
fill 3095 63 2993 3140 63 3007 minecraft:stone
fill 3095 64 2993 3140 72 3007 minecraft:air
kill @e[type=!player,x=3095,y=60,z=2993,dx=45,dy=20,dz=14]
# 行 z 2997: 投げたゾンビ T が Z に当たる → 両方生きる。Z は +x へ弾かれ、その先のトゲ(x 3107〜3116)で死ぬ
fill 3107 64 2996 3116 64 2998 minecraft:amethyst_cluster
execute positioned 3104.5 64 2997.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hooktest.z
tag @e[tag=hook.new] remove hook.new
# 行 z 3000: 投げたゾンビ W が壁(x 3104)に当たる → 死なずに怯む
fill 3104 64 2999 3104 67 3001 minecraft:stone
# 行 z 3003: 投げたゾンビ U が K に当たる(先にギミックなし)→ 両方生きる。K は怯んで +x へ 2 マス以上動く
execute positioned 3104.5 64 3003.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hooktest.k
tag @e[tag=hook.new] remove hook.new
# x 3130: 投げた爆弾兵 B がゾンビ D に当たる → 爆発で D も死ぬ
execute positioned 3134.5 64 3000.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hooktest.d
tag @e[tag=hook.new] remove hook.new
# 掴んだことにして投げる(向き +x)。投げた敵は同時に 1 体だけなので 10 tick おきに
execute positioned 3100.5 64 2997.5 run function hooktest:combat/throw {kind:"zombie",tag:"hooktest.t"}
schedule function hooktest:combat/throw2 10t
schedule function hooktest:combat/throw3 20t
schedule function hooktest:combat/throw4 30t
schedule function hooktest:combat/judge 70t
