#> hook:stage/0/start
# @s = プレイヤー。訓練場の最初へ
scoreboard players set @s hook.stage 0
scoreboard players set @s hook.tut 1
tag @s remove hook.grabbed_heavy
kill @e[tag=hook.tut]
function hook:cp/set {id:0,x:-28.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
title @s title {text:"訓練場",color:"gold"}
tellraw @s [{text:"[師範] ",color:"yellow"},{text:"よく来た。武器はフックショットだけ、敵を直接殴ることはできん。まずは使い方を体で覚えろ。",color:"white"}]
tellraw @s [{text:"[師範] ",color:"yellow"},{text:"フックショットを持ち、谷の向こうの柱を見て右クリック。刺さった所へお前が飛ぶ。",color:"white"}]
