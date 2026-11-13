execute as @e[tag=hook.enemy,x=2995,y=60,z=2995,dx=50,dy=20,dz=10] at @s run function hook:enemy/kill
schedule function hooktest:enemy/killed 3t
