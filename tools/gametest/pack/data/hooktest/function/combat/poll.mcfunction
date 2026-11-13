execute if score #rdyc hook.temporary matches 1 run return 0
scoreboard players add #wc hook.temporary 1
kill @e[type=marker,tag=hooktest.probe]
summon marker 3100.5 64 3000.5 {Tags:["hooktest.probe"]}
summon marker 3130.5 64 3000.5 {Tags:["hooktest.probe"]}
execute if entity @e[type=marker,tag=hooktest.probe,x=3100,y=60,z=2990,dx=2,dy=10,dz=20] if entity @e[type=marker,tag=hooktest.probe,x=3130,y=60,z=2990,dx=2,dy=10,dz=20] run function hooktest:combat/ready
execute if score #wc hook.temporary matches 1500.. run say HOOKTEST combat.chunks FAIL chunks never became entity-processing
execute if score #wc hook.temporary matches ..1499 unless entity @e[type=marker,tag=hooktest.probe,x=3100,y=60,z=2990,dx=2,dy=10,dz=20] run schedule function hooktest:combat/poll 1t
execute if score #wc hook.temporary matches ..1499 unless entity @e[type=marker,tag=hooktest.probe,x=3130,y=60,z=2990,dx=2,dy=10,dz=20] run schedule function hooktest:combat/poll 1t
