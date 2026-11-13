execute if score #rdyg hook.temporary matches 1 run return 0
scoreboard players add #wg hook.temporary 1
kill @e[type=marker,tag=hooktest.probe]
summon marker 3040.5 64 3000.5 {Tags:["hooktest.probe"]}
summon marker 3080.5 64 3000.5 {Tags:["hooktest.probe"]}
execute if entity @e[type=marker,tag=hooktest.probe,x=3040,y=60,z=2990,dx=2,dy=10,dz=20] if entity @e[type=marker,tag=hooktest.probe,x=3080,y=60,z=2990,dx=2,dy=10,dz=20] run function hooktest:gimmick/ready
execute if score #wg hook.temporary matches 1500.. run say HOOKTEST gimmick.chunks FAIL chunks never became entity-processing
execute if score #wg hook.temporary matches ..1499 unless entity @e[type=marker,tag=hooktest.probe,x=3040,y=60,z=2990,dx=2,dy=10,dz=20] run schedule function hooktest:gimmick/poll 1t
execute if score #wg hook.temporary matches ..1499 unless entity @e[type=marker,tag=hooktest.probe,x=3080,y=60,z=2990,dx=2,dy=10,dz=20] run schedule function hooktest:gimmick/poll 1t
