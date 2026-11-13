execute if score #rdy4 hook.temporary matches 1 run return 0
scoreboard players add #w4 hook.temporary 1
execute unless data storage hook: built{s4:1b} run function hook:stage/4/build
kill @e[type=marker,tag=hooktest.probe4]
summon marker 1550.5 64 0.5 {Tags:["hooktest.probe4"]}
execute if data storage hook: built{s4:1b} if entity @e[type=marker,tag=hooktest.probe4,x=1550,y=59,z=0,dx=1,dy=10,dz=1] run function hooktest:stage4/ready
execute if score #w4 hook.temporary matches 3000.. run say HOOKTEST stage4.built FAIL build did not finish (chunks not loaded or built flag never set)
execute if score #w4 hook.temporary matches ..2999 if score #rdy4 hook.temporary matches 0 run schedule function hooktest:stage4/poll 1t
