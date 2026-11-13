execute if score #rdye hook.temporary matches 1 run return 0
scoreboard players add #we hook.temporary 1
kill @e[type=marker,tag=hooktest.probe]
summon marker 3000.5 64 3000.5 {Tags:["hooktest.probe"]}
summon marker 3030.5 64 3000.5 {Tags:["hooktest.probe"]}
execute if entity @e[type=marker,tag=hooktest.probe,x=3000,y=60,z=2990,dx=2,dy=10,dz=20] if entity @e[type=marker,tag=hooktest.probe,x=3030,y=60,z=2990,dx=2,dy=10,dz=20] run function hooktest:enemy/summon
execute if score #we hook.temporary matches 1500.. run say HOOKTEST enemy.chunks FAIL chunks never became entity-processing
execute if score #we hook.temporary matches ..1499 unless entity @e[type=marker,tag=hooktest.probe,x=3000,y=60,z=2990,dx=2,dy=10,dz=20] run schedule function hooktest:enemy/poll 1t
execute if score #we hook.temporary matches ..1499 unless entity @e[type=marker,tag=hooktest.probe,x=3030,y=60,z=2990,dx=2,dy=10,dz=20] run schedule function hooktest:enemy/poll 1t
