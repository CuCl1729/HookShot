execute if score #rdy3 hook.temporary matches 1 run return 0
scoreboard players add #w3 hook.temporary 1
execute unless data storage hook: built{s3:1b} run function hook:stage/3/build
kill @e[type=marker,tag=hooktest.probe3]
summon marker 1010.5 64 0.5 {Tags:["hooktest.probe3"]}
execute if data storage hook: built{s3:1b} if entity @e[type=marker,tag=hooktest.probe3,x=1010,y=59,z=0,dx=1,dy=10,dz=1] run function hooktest:stage3/ready
execute if score #w3 hook.temporary matches 3000.. run say HOOKTEST stage3.built FAIL build did not finish (chunks not loaded or built flag never set)
execute if score #w3 hook.temporary matches ..2999 if score #rdy3 hook.temporary matches 0 run schedule function hooktest:stage3/poll 1t
