#> hook:stage/3/wave/2
# 重装兵1・スケルトン2(重装兵は飛び込んで突き落とす)
execute in hook:world positioned 1286.5 99 0.5 run function hook:enemy/summon/heavy
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
execute in hook:world positioned 1290.5 99 -6.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
execute in hook:world positioned 1290.5 99 7.5 run function hook:enemy/summon/skeleton
tag @e[tag=hook.new] add hook.s3
tag @e[tag=hook.new] add hook.s3w
tellraw @a[scores={hook.stage=3}] {text:"重装兵は掴めない。縁を背にした時に飛び込もう。",color:"gray"}
