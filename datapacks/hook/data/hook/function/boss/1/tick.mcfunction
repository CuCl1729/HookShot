#> hook:boss/1/tick
# 毎 tick(hook:stage/1/tick から)。無敵時間を減らす。戦闘中に誰も闘技場(谷の上空を含む x 454〜500)にいなければやり直し(死亡・落下で前室へ戻ったとき)
execute if score #b1.inv hook.temporary matches 1.. run scoreboard players remove #b1.inv hook.temporary 1
# 入口の谷へ落ちたら中央へ戻す(奈落で死ぬと無敵中は当たりにならず、虚空で消えて戦闘がやり直しになっていた)
execute in hook:world as @e[tag=hook.boss1,y=0,dy=60] run tp @s 483.5 64 7.5
execute if entity @e[tag=hook.boss1] in hook:world unless entity @a[scores={hook.stage=1},x=454,y=40,z=0,dx=47,dy=60,dz=16] run function hook:boss/1/reset
