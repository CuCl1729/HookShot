#> hook:stage/3/lesson
# @s = 区画0のプレイヤー。稽古のゾンビ(同じ島で向かってくる)をフックでスタンさせたら道を開く。いなければ出す
execute if entity @e[tag=hook.s3.t,tag=hook.stun] run return run function hook:stage/3/open1
execute if entity @e[tag=hook.s3.t] run return 0
execute in hook:world positioned 1009.5 64 0.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3.t
