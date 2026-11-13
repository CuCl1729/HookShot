#> hook:enemy/explode
# @s = 倒れる爆弾兵(tag hook.dying)。地形を壊さずプレイヤーも傷つけない爆発で、半径 4 の敵を倒す(爆弾兵は連鎖する)
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 1
# 自爆(hook.selfboom、enemy/fuse が付ける)はボスに効かない。ボスを削れるのはプレイヤーが投げた・ギミックへ運んだ爆弾兵だけ
execute as @e[tag=hook.enemy,tag=!hook.boss,tag=!hook.dying,distance=..4] at @s run function hook:enemy/kill
execute unless entity @s[tag=hook.selfboom] as @e[tag=hook.boss,distance=..4] at @s run function hook:enemy/kill
