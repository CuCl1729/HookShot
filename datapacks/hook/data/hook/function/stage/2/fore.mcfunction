#> hook:stage/2/fore
# @s = プレイヤー。ボス部屋の前室。ここがボス戦のやり直し地点
function hook:cp/set {id:25,x:810.5,y:64,z:0.5,yaw:-90}
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
function hook:fairy/say {text:"この先に番人がいる。重くて引けないから、プレスの下で潰そう"}
tellraw @s {text:"機巧の番人は重く、引き寄せられない。壁際のプレスの下で潰す。",color:"gray"}
tellraw @s {text:"突き飛ばす・突進を壁へ誘う・跳びかかりをプレスの下へ誘う・敵を投げ当てる。止まった5秒の間に標的を撃つ。",color:"gray"}
function hook:guide/set {text:"機巧の番人を倒す",x:841.5,y:64,z:0.5}
