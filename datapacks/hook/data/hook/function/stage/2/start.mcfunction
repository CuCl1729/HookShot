#> hook:stage/2/start
# @s = プレイヤー。歯車工場(x 600〜900)の最初へ。地形(扉・炉・クレーン・格子・光の粒)・敵・ボス戦・進行を最初からにする
scoreboard players set @s hook.stage 2
# ボス1撃破で得ているはず(単体で試すときのため)
execute unless score @s hook.ability matches 1.. run scoreboard players set @s hook.ability 1
scoreboard objectives add hook.b2 dummy
scoreboard objectives add hook.s2 dummy
scoreboard objectives add hook.press dummy
execute in hook:world run forceload add 600 -64 900 63
kill @e[tag=hook.s2]
data remove storage hook: s2
# 次の tick から hook:stage/2/build が建て直す(その間 tick がプレイヤーをチェックポイントに留める)
data remove storage hook: built.s2
# 進行(hook.s2 の偽プレイヤー): #ra #rb #rc 炉の停止 / #an A で潰した数 / #cw #ct C のウェーブ / #kt クレーン / #hub #ae #be 到着済み / #door 扉
scoreboard players set #ra hook.s2 0
scoreboard players set #rb hook.s2 0
scoreboard players set #rc hook.s2 0
scoreboard players set #an hook.s2 0
scoreboard players set #cw hook.s2 0
scoreboard players set #ct hook.s2 0
scoreboard players set #kt hook.s2 0
scoreboard players set #hub hook.s2 0
scoreboard players set #ae hook.s2 0
scoreboard players set #be hook.s2 0
scoreboard players set #door hook.s2 0
execute in hook:world run function hook:boss/2/reset
function hook:cp/set {id:20,x:603.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
function hook:score/start
title @s times 10 60 20
title @s title {text:"歯車工場",color:"gold"}
title @s subtitle {text:"太陽石の欠片 1/3",color:"yellow"}
tellraw @s {text:"太陽石の欠片 1/3。次の欠片は、この工場の番人が持っている。",color:"gray",italic:true}
tellraw @s {text:"奥の扉は、動力炉を3基とも止めると開く。",color:"gray",italic:true}
