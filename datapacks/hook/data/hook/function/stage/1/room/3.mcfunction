#> hook:stage/1/room/3
# @s = プレイヤー。R3 崩れた足場: 柱から柱へ飛び移る
function hook:cp/set {id:12,x:282.5,y:64,z:7.5,yaw:-90}
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"足場が崩れている。足場に立つ柱を狙えば、柱の手前に降りられる。",color:"white"}]
