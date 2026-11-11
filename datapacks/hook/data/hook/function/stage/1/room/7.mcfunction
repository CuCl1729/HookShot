#> hook:stage/1/room/7
# @s = プレイヤー。R7 前室
function hook:cp/set {id:16,x:451.5,y:64,z:7.5,yaw:-90}
tellraw @s [{text:"[坑夫の書き置き] ",color:"light_purple"},{text:"この先に巨兵がいる。奴の体は何をしても傷つかない。だが、奴が育てた水晶のトゲだけは、奴自身を貫く。",color:"white"}]
