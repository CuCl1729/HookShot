#> hook:stage/1/arrive/a
# @s = 竪坑 A に初めて入ったプレイヤー。L1 に爆弾兵1、L2・L3 にスケルトン1ずつ
scoreboard players set #a hook.s1 1
function hook:cp/set {id:12,x:230.5,y:51,z:-22.5,yaw:180}
function hook:stage/1/spawn {k:"bomber",x:224.5,y:63,z:-32.5,t:"hook.s1a"}
function hook:stage/1/spawn {k:"skeleton",x:236.5,y:75,z:-38.5,t:"hook.s1a"}
function hook:stage/1/spawn {k:"skeleton",x:224.5,y:87,z:-38.5,t:"hook.s1a"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"竪坑: 左右の張り出しの縁を撃って登れ。水晶鍵はいちばん上。",color:"gray"}]
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"射ってくるスケルトンは引き寄せて、底のトゲへ投げ落とせ。",color:"gray"}]
