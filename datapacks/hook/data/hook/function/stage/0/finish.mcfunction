#> hook:stage/0/finish
# @s = トゲで2体を倒したプレイヤー。訓練修了。里の門を開ける(くぐると stage/0/player が hook:stage/1/start)
scoreboard players set @s hook.tut 9
kill @e[tag=hook.tut8]
execute in hook:world run fill -25 64 27 -25 69 31 minecraft:air
execute in hook:world run particle minecraft:end_rod -25 66.5 29 0.3 2 2 0.02 60 force @a
playsound minecraft:block.iron_door.open master @s ~ ~ ~ 1 0.8
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
title @s times 10 50 15
title @s subtitle {text:"西の門が開いた",color:"gray"}
title @s title {text:"訓練修了",color:"gold"}
tellraw @s {text:"§e師範§f「欠片は三つ。最初のひとつは坑道の巨兵が持っておる。行け」"}
