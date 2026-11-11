#> hook:stage/2/start
# @s = プレイヤー。歯車工場(x 600〜863)の最初へ。敵・ボス戦を最初からにする
scoreboard players set @s hook.stage 2
# ボス1撃破で得ているはず(単体で試すときのため)
execute unless score @s hook.ability matches 1.. run scoreboard players set @s hook.ability 1
scoreboard objectives add hook.b2 dummy
execute in hook:world run forceload add 592 -16 879 15
kill @e[tag=hook.s2]
data remove storage hook: s2
execute in hook:world run function hook:boss/2/reset
function hook:cp/set {id:20,x:603.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
title @s title {text:"歯車工場",color:"gold"}
title @s subtitle {text:"第二の門",color:"gray"}
tellraw @s {text:"止まったはずの工場で、歯車がまだ回っている。虚の王のための兵器を、誰もいないまま作り続けているのだ。",color:"gray",italic:true}
