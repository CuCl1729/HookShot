#> hook:stage/1/room/8
# @s = プレイヤー。闘技場の入口。復帰地点は前室のまま(闘技場の外へ戻ることでボス戦がやり直しになる)。奥 x>=466 へ入るとボス戦
function hook:cp/set {id:17,x:451.5,y:64,z:7.5,yaw:-90}
playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 0.6
