#> hook:stage/3/bell/rang
# @s = 鐘のスイッチ(実行位置 = 標的)。@macro name。チェックポイントを広場へ移す(奈落へ飛び降りれば広場へ戻れる)
playsound minecraft:block.bell.use block @a ~ ~ ~ 4 0.8
playsound minecraft:block.bell.resonate block @a ~ ~ ~ 4 1
particle minecraft:end_rod ~ ~-1 ~ 1.5 1.5 1.5 0.05 80 force @a
scoreboard players add #bells hook.s3 1
$tellraw @a[scores={hook.stage=3}] [{text:"$(name)が鳴った ",color:"aqua"},{score:{name:"#bells",objective:"hook.s3"},color:"white"},{text:" / 3",color:"white"}]
execute as @a[scores={hook.stage=3}] run function hook:stage/3/cp {id:31,x:1068.5,y:70,z:0.5,yaw:-90}
execute if score #bells hook.s3 matches ..2 run tellraw @a[scores={hook.stage=3}] {text:"風の鐘の音が広場の灯をともした。奈落へ飛び降りれば、広場へ戻れる。",color:"gray"}
execute if score #bells hook.s3 matches 3 run function hook:stage/3/bridge
