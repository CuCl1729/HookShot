#> hook:stage/2/over
# @s = 扉が開く前に東の壁を越えたプレイヤー。チェックポイントへ戻す
function hook:cp/return
tellraw @s {text:"扉はまだ閉じている。動力炉を3基とも止めよう。",color:"gray",italic:true}
