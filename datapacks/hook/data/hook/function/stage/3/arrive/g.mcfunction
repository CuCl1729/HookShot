#> hook:stage/3/arrive/g
# @s = 門の島 G に降りたプレイヤー。番兵が3波(wave/tick)
scoreboard players set #g hook.s3 1
function hook:stage/3/cp {id:38,x:1270.5,y:99,z:0.5,yaw:-90}
scoreboard players set #wave hook.s3 1
scoreboard players set #wt hook.s3 40
scoreboard players set #ws hook.s3 0
title @s times 10 40 10
title @s title {text:"門の島",color:"aqua"}
title @s subtitle {text:"番兵を、ひとり残らず空へ",color:"gray"}
tellraw @s {text:"門を守る番兵が来る。この島に壁は無い。投げても、突いても、落ちれば終わり。",color:"gray"}
