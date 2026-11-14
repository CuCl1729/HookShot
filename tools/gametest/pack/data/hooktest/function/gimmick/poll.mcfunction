execute if score #rdyg hook.temporary matches 1 run return 0
scoreboard players add #wg hook.temporary 1
kill @e[type=marker,tag=hooktest.probe]
summon marker 3040.5 64 3000.5 {Tags:["hooktest.probe"]}
summon marker 3080.5 64 3000.5 {Tags:["hooktest.probe"]}
summon marker 3065.5 64 3000.5 {Tags:["hooktest.probe"]}
# 両方の目印が見えたら数え、40 tick 続けて見えてから進める(見え始めた直後は実体がまだ動かない tick があり、怯み・爆発・kill がまれに間に合わなかった)
execute if entity @e[type=marker,tag=hooktest.probe,x=3040,y=60,z=2990,dx=2,dy=10,dz=20] if entity @e[type=marker,tag=hooktest.probe,x=3080,y=60,z=2990,dx=2,dy=10,dz=20] if entity @e[type=marker,tag=hooktest.probe,x=3065,y=60,z=2990,dx=2,dy=10,dz=20] run scoreboard players add #sg hook.temporary 1
execute if score #sg hook.temporary matches 40.. if score #rdyg hook.temporary matches 0 run function hooktest:gimmick/ready
execute if score #wg hook.temporary matches 1500.. if score #rdyg hook.temporary matches 0 run say HOOKTEST gimmick.chunks FAIL chunks never became entity-processing
execute if score #wg hook.temporary matches ..1499 if score #rdyg hook.temporary matches 0 run schedule function hooktest:gimmick/poll 1t
