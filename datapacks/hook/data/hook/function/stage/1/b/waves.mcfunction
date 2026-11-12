#> hook:stage/1/b/waves
# 広間の波(#bw 1〜3。in hook:world)。全滅から 2 秒で次の波。重装兵だけが残ったら、投げる敵を 5 秒ごとに足す(詰み防止)
execute if score #bw hook.s1 matches 3 if score #tick hook.temporary matches 0 if entity @e[tag=hook.s1b,tag=hook.heavy] unless entity @e[tag=hook.s1b,tag=!hook.heavy] run function hook:stage/1/spawn {k:"zombie",x:230.5,y:71,z:33.5,t:"hook.s1b"}
execute if entity @e[tag=hook.s1b] run return run scoreboard players set #bt hook.s1 0
scoreboard players add #bt hook.s1 1
execute if score #bt hook.s1 matches ..39 run return 0
scoreboard players set #bt hook.s1 0
scoreboard players add #bw hook.s1 1
execute if score #bw hook.s1 matches 2 run return run function hook:stage/1/b/w2
execute if score #bw hook.s1 matches 3 run return run function hook:stage/1/b/w3
function hook:stage/1/b/clear
