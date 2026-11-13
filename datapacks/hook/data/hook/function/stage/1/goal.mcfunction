#> hook:stage/1/goal
# 大空洞での「いまの目的」(hook:guide/set)。鍵の数と、どの鍵を取ったか(#ka 竪坑 / #kb 広間 / #kc 選鉱場)から次の行き先を選ぶ。
# 呼ぶ所: arrive/hub、key(3つ未満のとき)。区画の中の目的は arrive/* ・b/clear ・c/done、門は gate、前室は arrive/ante、ボスは boss/1/*
execute if score #keys hook.s1 matches 3.. run return run function hook:guide/set {text:"東上段の門から奥へ",x:253,y:101,z:0}
execute if score #ka hook.s1 matches 0 run return run function hook:guide/set {text:"南の竪坑で水晶鍵を取る",x:230,y:51,z:-21}
execute if score #kb hook.s1 matches 0 run return run function hook:guide/set {text:"北の広間で水晶鍵を取る",x:230,y:71,z:21}
execute if score #kc hook.s1 matches 0 run function hook:guide/set {text:"東の選鉱場で水晶鍵を取る",x:251,y:71,z:10}
