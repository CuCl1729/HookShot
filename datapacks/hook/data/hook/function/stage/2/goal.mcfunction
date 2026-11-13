#> hook:stage/2/goal
# 次に止める動力炉を案内する(ハブに入ったとき・炉を止めたとき)。順は 北 A → 南 C → 東 B(近い順)。3基とも止まったら扉(hook:stage/2/door)が案内する
execute if score #ra hook.s2 matches 0 run return run function hook:guide/set {text:"北の圧延ラインの炉を止める",x:660.5,y:64,z:-24.5}
execute if score #rc hook.s2 matches 0 run return run function hook:guide/set {text:"南の組立場の炉を止める",x:676.5,y:64,z:12.5}
execute if score #rb hook.s2 matches 0 run return run function hook:guide/set {text:"東の柱を登り高所の炉へ",x:771.5,y:81,z:34.5}
