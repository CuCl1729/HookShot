#> hook:stage/1/arrive/c
# @s = 選鉱場 C に初めて入ったプレイヤー。窪みの的3の前に重装兵(足止め・出し直さない。トゲの上に立たせてあり、敵を投げ当てて弾けばトゲで倒れる)、
# ゾンビ2(投げても倒れないので使い回せる。トゲで倒れたら的が残る間 c/feed が席ごとに1体まで出し直す)
scoreboard players set #c hook.s1 1
function hook:cp/set {id:14,x:261.5,y:71,z:10.5,yaw:-90}
function hook:stage/1/spawn {k:"heavy",x:295.5,y:71,z:19.5,t:"hook.s1c3h"}
execute as @e[tag=hook.s1c3h] run attribute @s minecraft:movement_speed base set 0
execute in hook:world run function hook:stage/1/c/feed
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"選鉱場: 3つの的(標的ブロック)に敵を投げ当てると、檻が開いて水晶鍵が取れる。フックで撃っても動かない。投げた敵は倒れないので、また掴んで使える。",color:"gray"}]
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"天井の的へは真上へ投げる。窪みの的は重装兵が塞いでいる。重装兵の足元はトゲ。敵を投げ当てて弾けば、トゲで倒れる。",color:"gray"}]
function hook:fairy/say {text:"的がいっぱい。敵を投げて当てるんだね"}
execute unless score #kc hook.s1 matches 1 run function hook:guide/set {text:"敵を投げて的3つに当てる",x:278,y:73,z:10}
