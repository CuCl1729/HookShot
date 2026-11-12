#> hook:stage/1/start
# @s = プレイヤー。水晶坑道の最初へ。何度呼んでも同じ状態に戻す(敵・鍵・光の粒・ボスを消し、地形は tick が build で建て直す)
scoreboard players set @s hook.stage 1
kill @e[type=!player,tag=hook.s1]
# 進行(hook.s1 の偽プレイヤー): #hub #a #c #ante 到着済み / #bw 広間の波(1〜3、4 = 済み)#bt 波の間 / #c1〜#c3 的 #cn 的の数 / #keys 水晶鍵 / #gate 門
scoreboard players set #hub hook.s1 0
scoreboard players set #a hook.s1 0
scoreboard players set #c hook.s1 0
scoreboard players set #ante hook.s1 0
scoreboard players set #bw hook.s1 0
scoreboard players set #bt hook.s1 0
scoreboard players set #c1 hook.s1 0
scoreboard players set #c2 hook.s1 0
scoreboard players set #c3 hook.s1 0
scoreboard players set #cn hook.s1 0
scoreboard players set #keys hook.s1 0
scoreboard players set #gate hook.s1 0
execute in hook:world run function hook:boss/1/reset
data remove storage hook: built.s1
execute in hook:world run forceload add 192 -64 511 63
function hook:cp/set {id:10,x:202.5,y:51,z:0.5,yaw:-90}
function hook:cp/return
function hook:score/start
title @s times 10 60 20
title @s subtitle {text:"太陽石の欠片 0/3",color:"yellow"}
title @s title {text:"水晶坑道",color:"light_purple"}
tellraw @s {text:"太陽石の欠片 0/3。最初の欠片は、坑道の最奥にいる水晶の巨兵が持っている。",color:"yellow"}
tellraw @s {text:"最奥の門は、水晶鍵を3つ集めると開く。",color:"gray"}
