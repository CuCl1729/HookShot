#> hook:stage/2/fore
# @s = プレイヤー。ボス部屋の前室。ここがボス戦のやり直し地点
function hook:cp/set {id:25,x:810.5,y:64,z:0.5,yaw:-90}
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
function hook:fairy/say {text:"この先に番人。重くて引けないから、壁際のプレスで"}
function hook:fairy/say {text:"突き飛ばすか、壁へ突進させるか、敵を投げ当てて"}
function hook:fairy/say {text:"止まった5秒のうちに、真上のプレスの標的を撃とう"}
function hook:guide/set {text:"機巧の番人を倒す",x:841.5,y:64,z:0.5}
