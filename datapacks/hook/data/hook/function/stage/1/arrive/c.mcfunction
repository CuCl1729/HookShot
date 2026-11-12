#> hook:stage/1/arrive/c
# @s = 選鉱場 C に初めて入ったプレイヤー。窪みの的3の前に重装兵(足止め・出し直さない)、ゾンビ2(的が残る間 c/feed が出し直す)
scoreboard players set #c hook.s1 1
function hook:cp/set {id:14,x:261.5,y:71,z:10.5,yaw:-90}
function hook:stage/1/spawn {k:"heavy",x:295.5,y:71,z:19.5,t:"hook.s1c3h"}
execute as @e[tag=hook.s1c3h] run attribute @s minecraft:movement_speed base set 0
execute in hook:world run function hook:stage/1/c/feed
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"選鉱場: 3つの的(標的ブロック)に敵を投げ当てると、檻が開いて水晶鍵が取れる。フックで撃っても動かない。",color:"gray"}]
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"天井の的へは真上へ投げる。窪みの的は重装兵が塞いでいる。先に重装兵へ敵を投げ当てて倒せ。",color:"gray"}]
