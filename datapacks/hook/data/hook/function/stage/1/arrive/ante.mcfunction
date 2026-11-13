#> hook:stage/1/arrive/ante
# @s = 前室に着いたプレイヤー。チェックポイント(闘技場の箱の外)
scoreboard players set #ante hook.s1 1
function hook:cp/set {id:15,x:303.5,y:97,z:0.5,yaw:-90}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"下の広間に水晶の巨兵がいる。降りると戦いが始まる。",color:"gray"}]
function hook:fairy/say {text:"この下……すごく強い気配。欠片もそこにあるよ"}
function hook:guide/set {text:"下の闘技場で巨兵と戦う",x:335,y:71,z:0}
