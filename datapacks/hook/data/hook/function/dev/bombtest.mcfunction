#> hook:dev/bombtest
# 爆弾兵の爆発だけを 1 tick で確かめる: 隣にゾンビ・スケルトンを置いて爆弾兵を倒し、キル数と残りを出す
kill @e[tag=hook.enemy]
scoreboard players set #kills hook.score 0
execute in hook:world positioned 1826.5 64 -4.5 run function hook:dev/spawn {kind:zombie,x:1826.5,y:64,z:-4.5,tag:dev.b}
execute in hook:world positioned 1828.5 64 -4.5 run function hook:dev/spawn {kind:skeleton,x:1828.5,y:64,z:-4.5,tag:dev.c}
function hook:dev/spawn {kind:bomber,x:1827.5,y:64,z:-6.5,tag:dev.a}
execute as @n[tag=dev.a] at @s run function hook:enemy/kill
execute store result score #n hook.temporary if entity @e[tag=hook.enemy]
tellraw @a ["bombtest kills ",{score:{name:"#kills",objective:"hook.score"}}," left ",{score:{name:"#n",objective:"hook.temporary"}}]
