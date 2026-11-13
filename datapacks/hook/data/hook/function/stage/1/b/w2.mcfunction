#> hook:stage/1/b/w2
# 第2波: 棚の上のスケルトン2、奥の爆弾兵1(爆発でまとめて倒せる。外れてもスケルトンは引いてトゲへ)
function hook:stage/1/spawn {k:"skeleton",x:213.5,y:81,z:45.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"skeleton",x:247.5,y:81,z:45.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"bomber",x:230.5,y:71,z:58.5,t:"hook.s1b"}
function hook:stage/1/b/fx {n:"第2波",sub:"スケルトン 2・爆弾兵 1"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"爆弾兵を掴んで、棚のスケルトンへ投げ込め。爆発なら敵は倒れる。外れたらスケルトンを引き落としてトゲへ。",color:"gray"}]
