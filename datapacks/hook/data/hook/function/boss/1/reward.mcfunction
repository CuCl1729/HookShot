#> hook:boss/1/reward
# 撃破の物語(2行)と欠片
execute as @a[scores={hook.stage=1}] at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
title @a[scores={hook.stage=1}] times 10 60 20
title @a[scores={hook.stage=1}] subtitle {text:"水晶の巨兵 撃破",color:"light_purple"}
title @a[scores={hook.stage=1}] title {text:"太陽石の欠片 1/3",color:"yellow"}
tellraw @a[scores={hook.stage=1}] {text:"巨兵は膝をつき、胸の水晶から太陽石の欠片がこぼれ落ちた。欠片の光で、鉤が輝く。",color:"yellow"}
tellraw @a[scores={hook.stage=1}] {text:"太陽石の欠片 1/3。次の欠片は、歯車工場の番人が持っている。",color:"yellow"}
