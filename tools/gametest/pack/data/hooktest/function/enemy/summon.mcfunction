scoreboard players set #rdye hook.temporary 1
kill @e[type=marker,tag=hooktest.probe]
say HOOKTEST enemy.chunks PASS
fill 2995 63 2995 3045 63 3005 minecraft:stone
fill 2995 64 2995 3045 70 3005 minecraft:air
kill @e[type=!player,x=2995,y=60,z=2995,dx=50,dy=20,dz=10]
execute positioned 3000.5 64 3000.5 run function hook:enemy/summon/zombie
execute positioned 3010.5 64 3000.5 run function hook:enemy/summon/skeleton
execute positioned 3020.5 64 3000.5 run function hook:enemy/summon/bomber
execute positioned 3030.5 64 3000.5 run function hook:enemy/summon/heavy
execute positioned 3000.5 64 3000.5 if entity @e[type=zombie,tag=hook.enemy,distance=..2] run say HOOKTEST enemy.zombie_tag PASS
execute positioned 3000.5 64 3000.5 unless entity @e[type=zombie,tag=hook.enemy,distance=..2] run say HOOKTEST enemy.zombie_tag FAIL
execute positioned 3000.5 64 3000.5 if entity @e[type=zombie,tag=hook.enemy,tag=!hook.heavy,distance=..2] if items entity @e[type=zombie,tag=hook.enemy,distance=..2] armor.head minecraft:leather_helmet run say HOOKTEST enemy.zombie_helmet PASS
execute positioned 3000.5 64 3000.5 unless items entity @e[type=zombie,tag=hook.enemy,distance=..2] armor.head minecraft:leather_helmet run say HOOKTEST enemy.zombie_helmet FAIL
execute positioned 3010.5 64 3000.5 if entity @e[type=skeleton,tag=hook.enemy,distance=..2] run say HOOKTEST enemy.skeleton_tag PASS
execute positioned 3010.5 64 3000.5 unless entity @e[type=skeleton,tag=hook.enemy,distance=..2] run say HOOKTEST enemy.skeleton_tag FAIL
execute positioned 3010.5 64 3000.5 if items entity @e[type=skeleton,tag=hook.enemy,distance=..2] armor.head minecraft:leather_helmet if items entity @e[type=skeleton,distance=..2] weapon.mainhand minecraft:bow run say HOOKTEST enemy.skeleton_gear PASS
execute positioned 3010.5 64 3000.5 unless items entity @e[type=skeleton,tag=hook.enemy,distance=..2] armor.head minecraft:leather_helmet run say HOOKTEST enemy.skeleton_gear FAIL
execute positioned 3020.5 64 3000.5 if entity @e[type=creeper,tag=hook.enemy,tag=hook.bomb,distance=..2] run say HOOKTEST enemy.bomber_tag PASS
execute positioned 3020.5 64 3000.5 unless entity @e[type=creeper,tag=hook.enemy,tag=hook.bomb,distance=..2] run say HOOKTEST enemy.bomber_tag FAIL
execute positioned 3030.5 64 3000.5 if entity @e[type=zombie,tag=hook.enemy,tag=hook.heavy,distance=..2] run say HOOKTEST enemy.heavy_tag PASS
execute positioned 3030.5 64 3000.5 unless entity @e[type=zombie,tag=hook.enemy,tag=hook.heavy,distance=..2] run say HOOKTEST enemy.heavy_tag FAIL
execute positioned 3030.5 64 3000.5 if items entity @e[type=zombie,tag=hook.heavy,distance=..2] armor.head minecraft:iron_helmet if items entity @e[type=zombie,tag=hook.heavy,distance=..2] armor.feet minecraft:iron_boots if items entity @e[type=zombie,tag=hook.heavy,distance=..2] weapon.mainhand minecraft:iron_axe run say HOOKTEST enemy.heavy_gear PASS
execute positioned 3030.5 64 3000.5 unless items entity @e[type=zombie,tag=hook.heavy,distance=..2] armor.head minecraft:iron_helmet run say HOOKTEST enemy.heavy_gear FAIL
execute positioned 3030.5 64 3000.5 as @e[type=zombie,tag=hook.heavy,distance=..2] store result score #sc hook.temporary run attribute @s scale get 10
execute if score #sc hook.temporary matches 14 run say HOOKTEST enemy.heavy_scale PASS
execute unless score #sc hook.temporary matches 14 run say HOOKTEST enemy.heavy_scale FAIL scale not 1.4
schedule function hooktest:enemy/kill 5t
