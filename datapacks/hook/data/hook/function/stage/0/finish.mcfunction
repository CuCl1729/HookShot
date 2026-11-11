#> hook:stage/0/finish
# @s = 重装兵へ飛び移ったプレイヤー。訓練修了 → ステージ1へ
scoreboard players set @s hook.tut 4
tag @s remove hook.grabbed_heavy
execute as @e[tag=hook.tut] at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a
kill @e[tag=hook.tut]
title @s title {text:"訓練修了",color:"gold"}
tellraw @s [{text:"[師範] ",color:"yellow"},{text:"見事。地形を使え、フックを使え。それがお前の剣だ。水晶坑道へ向かえ。",color:"white"}]
function hook:stage/1/start
