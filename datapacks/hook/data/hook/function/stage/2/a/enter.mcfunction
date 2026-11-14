#> hook:stage/2/a/enter
# @s = プレイヤー。圧延ラインに来た: 案内とキャットウォークのスケルトン2体(倒すのは任意)
scoreboard players set #ae hook.s2 1
execute in hook:world positioned 655.5 74 -38.5 run function hook:enemy/summon/skeleton
execute in hook:world positioned 690.5 74 -38.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s2
function hook:fairy/say {text:"ここのプレスは撃って2秒後に落ちるよ。床の炎が印"}
function hook:fairy/say {text:"台車が来る少し前に撃って、3基で1回ずつ潰そう"}
function hook:guide/set {text:"台車を3基のプレスで潰す",x:660.5,y:64,z:-27.5}
