#> hook:stage/2/room/6
# @s = プレイヤー。ボス部屋の前室。ここがボス戦のやり直し地点
function hook:cp/set {id:25,x:810.5,y:76,z:0.5,yaw:-90}
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[声] ",color:"aqua"},{text:"この先に「機巧の番人」がいる。工場を守るためだけに作られた、重い鉄の体だ。",color:"white"}]
tellraw @s [{text:"[声] ",color:"aqua"},{text:"重すぎて引き寄せられないが、突き飛ばせる。壁際のプレスの下へ叩き込み、標的を撃て。",color:"white"}]
