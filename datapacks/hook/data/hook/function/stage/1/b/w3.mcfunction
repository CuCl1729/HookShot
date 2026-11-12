#> hook:stage/1/b/w3
# 第3波: 重装兵1、ゾンビ2
function hook:stage/1/spawn {k:"heavy",x:230.5,y:71,z:57.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"zombie",x:222.5,y:71,z:59.5,t:"hook.s1b"}
function hook:stage/1/spawn {k:"zombie",x:238.5,y:71,z:59.5,t:"hook.s1b"}
title @a[scores={hook.stage=1}] times 5 30 10
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle {text:"第3波",color:"light_purple"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"重装兵は引き寄せられない。ゾンビを掴んで重装兵へ投げ当てれば、まとめて倒れる。",color:"gray"}]
