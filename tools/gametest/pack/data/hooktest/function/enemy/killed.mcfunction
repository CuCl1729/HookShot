execute if entity @e[tag=hook.enemy,x=2995,y=60,z=2995,dx=50,dy=20,dz=10] run say HOOKTEST enemy.kill FAIL enemies remain after hook:enemy/kill
execute unless entity @e[tag=hook.enemy,x=2995,y=60,z=2995,dx=50,dy=20,dz=10] run say HOOKTEST enemy.kill PASS
