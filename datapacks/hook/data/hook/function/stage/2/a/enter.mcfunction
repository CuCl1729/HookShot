#> hook:stage/2/a/enter
# @s = プレイヤー。圧延ラインに来た: 案内とキャットウォークのスケルトン2体
scoreboard players set #ae hook.s2 1
execute in hook:world positioned 655.5 74 -38.5 run function hook:enemy/summon/skeleton
execute in hook:world positioned 690.5 74 -38.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s2
tellraw @s {text:"圧延ライン: 炉心の台車がレールを往復している。ここのプレスは標的を撃ってから2秒後に落ちる(床に炎の印)。",color:"gray"}
tellraw @s {text:"台車が来る少し前に撃ち、3基のプレスでそれぞれ1回ずつ潰せば炉が止まる。",color:"gray"}
