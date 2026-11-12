#> hook:stage/3/wave/1
# ゾンビ2・爆弾兵1(掴んで投げる)
execute in hook:world positioned 1286.5 99 -4.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
execute in hook:world positioned 1286.5 99 5.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
execute in hook:world positioned 1289.5 99 0.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
