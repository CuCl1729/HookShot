#> hook:stage/0/s4
# @s = D 台に着いたプレイヤー。次は掴んで投げる(標的)
scoreboard players set @s hook.tut 4
scoreboard players set #t hook.tut 0
function hook:cp/set {id:3,x:84.5,y:64,z:8.5,yaw:0}
execute in hook:world run tp @e[tag=hook.npc] 90.5 64 10.5
function hook:stage/0/sp4
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
execute if score #fl hook.tut matches 0 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"(フロートは後で必ず要る。空中でスニーク)",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"掴む・投げる: 軽い敵にフックを当てると、目の前まで引き寄せて掴む。もう一度右クリックで見ている方へ投げる。",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"台の上のゾンビを掴み、壁の的(標的ブロック)に投げ当てろ。扉が開く。",color:"gray"}]
