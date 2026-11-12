#> hook:stage/2/a/tick
# hook:world で毎 tick(炉 A が動いている間)。台車を進め、台車を潰したか調べる
execute as @e[type=block_display,tag=hook.s2core] at @s run function hook:stage/2/a/move
execute as @e[type=marker,tag=hook.press,scores={hook.press=3},x=645,y=60,z=-32,dx=30,dy=20,dz=10] at @s positioned ~-2.5 ~-6 ~-2.5 if entity @e[type=block_display,tag=hook.s2core,dx=4,dy=4,dz=4] run function hook:stage/2/a/crush
