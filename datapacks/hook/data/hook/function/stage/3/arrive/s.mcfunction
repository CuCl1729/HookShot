#> hook:stage/3/arrive/s
# @s = 南の島 SI に着いたプレイヤー(崩れ雲を渡り切った)
scoreboard players set #sisl hook.s3 1
function hook:stage/3/cp {id:36,x:1182.5,y:79,z:37.5,yaw:-90}
execute in hook:world positioned 1192.5 79 42.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s3
function hook:guide/set {text:"鐘の上の標的を撃つ",x:1189.5,y:79,z:40.5}
tellraw @s {text:"射手と爆弾兵がいる。爆弾兵を射手へ投げつけよう。鐘はその後。",color:"gray"}
