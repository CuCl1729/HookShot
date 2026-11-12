#> hook:stage/1/b/w2
# 第2波: 棚の上のスケルトン2、奥の爆弾兵1
function hook:stage/1/spawn {k:"skeleton",x:213.5,y:81,z:45.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"skeleton",x:247.5,y:81,z:45.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"bomber",x:230.5,y:71,z:58.5,t:"hook.s1b"}
title @a[scores={hook.stage=1}] times 5 30 10
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle {text:"第2波",color:"light_purple"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"爆弾兵を掴んで、棚のスケルトンへ投げ込め。",color:"gray"}]
