execute if score #rdy0 hook.temporary matches 1 run return 0
scoreboard players add #w0 hook.temporary 1
kill @e[type=marker,tag=hooktest.probe0]
summon marker 24.5 64 24.5 {Tags:["hooktest.probe0"]}
execute if data storage hook: built{s0:1b} if entity @e[type=marker,tag=hooktest.probe0,x=24,y=60,z=24,dx=1,dy=10,dz=1] run function hooktest:stage0/ready
execute if score #w0 hook.temporary matches 3000.. run say HOOKTEST stage0.built FAIL build did not finish
execute if score #w0 hook.temporary matches ..2999 if score #rdy0 hook.temporary matches 0 run schedule function hooktest:stage0/poll 1t
