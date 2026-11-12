#> hook:stage/3/wave/3
# 重装兵2・爆弾兵1(爆弾兵を重装兵へ投げれば両方)
execute in hook:world positioned 1284.5 99 -5.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
execute in hook:world positioned 1284.5 99 6.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
execute in hook:world positioned 1289.5 99 0.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
