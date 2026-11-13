execute if score #rdy1 hook.temporary matches 1 run return 0
scoreboard players add #w1 hook.temporary 1
execute unless data storage hook: built{s1:1b} run function hook:stage/1/build
kill @e[type=marker,tag=hooktest.probe1]
summon marker 345.5 71 0.5 {Tags:["hooktest.probe1"]}
execute if data storage hook: built{s1:1b} if entity @e[type=marker,tag=hooktest.probe1,x=345,y=66,z=0,dx=1,dy=10,dz=1] run function hooktest:stage1/ready
execute if score #w1 hook.temporary matches 3000.. run say HOOKTEST stage1.built FAIL build did not finish (chunks not loaded or built flag never set)
execute if score #w1 hook.temporary matches ..2999 if score #rdy1 hook.temporary matches 0 run schedule function hooktest:stage1/poll 1t
