#> hook:stage/1/b/w3
# 第3波: 重装兵1、ゾンビ1、爆弾兵1。重装兵は引けないので、爆弾兵の爆発か、敵を投げ当ててトゲへ弾く
function hook:stage/1/spawn {k:"heavy",x:230.5,y:71,z:57.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"zombie",x:222.5,y:71,z:59.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"bomber",x:238.5,y:71,z:59.5,t:"hook.s1b"}
function hook:stage/1/b/fx {n:"第3波",sub:"重装兵 1・ゾンビ 1・爆弾兵 1"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"重装兵は引き寄せられない。爆弾兵を投げ当てて爆発で倒すか、トゲの島のそばで敵を投げ当てて弾き込め。爆弾兵が居なくなれば、また湧く。",color:"gray"}]
