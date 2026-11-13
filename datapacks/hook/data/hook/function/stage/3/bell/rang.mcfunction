#> hook:stage/3/bell/rang
# @s = 鐘のスイッチ(実行位置 = 標的)。@macro name。チェックポイントを広場へ移す(奈落へ飛び降りれば広場へ戻れる)
playsound minecraft:block.bell.use block @a ~ ~ ~ 4 0.8
playsound minecraft:block.bell.resonate block @a ~ ~ ~ 4 1
playsound minecraft:block.amethyst_block.resonate block @a ~ ~ ~ 3 1.2
playsound minecraft:entity.firework_rocket.twinkle block @a ~ ~ ~ 3 1
particle minecraft:end_rod ~ ~-1 ~ 1.5 1.5 1.5 0.05 80 force @a
particle minecraft:firework ~ ~-1 ~ 2 2 2 0.1 60 force @a
particle minecraft:totem_of_undying ~ ~-1 ~ 1.5 1.5 1.5 0.3 40 force @a
scoreboard players add #bells hook.s3 1
$tellraw @a[scores={hook.stage=3}] [{text:"$(name)が鳴った ",color:"aqua"},{score:{name:"#bells",objective:"hook.s3"},color:"white"},{text:" / 3",color:"white"}]
execute as @a[scores={hook.stage=3}] run function hook:stage/3/cp {id:31,x:1068.5,y:70,z:0.5,yaw:-90}
# 広場の灯がともる(広場の柱の上で光の輪)
execute in hook:world run particle minecraft:end_rod 1091 73 0 0.5 2 5 0.05 60 force @a
execute if score #bells hook.s3 matches 1 run function hook:fairy/say {text:"ひとつ目の鐘！ 広場の灯がともったよ。奈落へ飛び降りれば広場へ戻れるからね"}
execute if score #bells hook.s3 matches 2 run function hook:fairy/say {text:"あとひとつ！ 橋の気配がしてきたよ"}
execute if score #bells hook.s3 matches ..2 run function hook:stage/3/bell/guide
execute if score #bells hook.s3 matches 3 run function hook:stage/3/bridge
