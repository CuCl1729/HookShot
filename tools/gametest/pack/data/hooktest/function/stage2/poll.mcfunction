execute if score #rdy2 hook.temporary matches 1 run return 0
scoreboard players add #w2 hook.temporary 1
execute unless data storage hook: built{s2:1b} run function hook:stage/2/build
kill @e[type=marker,tag=hooktest.probe2]
summon marker 852.5 64 0.5 {Tags:["hooktest.probe2"]}
execute if data storage hook: built{s2:1b} if entity @e[type=marker,tag=hooktest.probe2,x=852,y=59,z=0,dx=1,dy=10,dz=1] run function hooktest:stage2/ready
execute if score #w2 hook.temporary matches 3000.. run say HOOKTEST stage2.built FAIL build did not finish (chunks not loaded or built flag never set)
execute if score #w2 hook.temporary matches ..2999 if score #rdy2 hook.temporary matches 0 run schedule function hooktest:stage2/poll 1t
