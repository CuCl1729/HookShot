#> hook:boss/1/tick
# 毎 tick(hook:stage/1/tick から)。戦闘中に誰も闘技場の箱にいなければやり直し(死亡・落下で前室へ戻ったとき)
# 巨兵に投げ当てた雑魚は砕けて消える(投げても死なないルールで、同じ雑魚を使い回せないように。boss/1/hit が印を付ける)
execute as @e[tag=hook.s1spent] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.2 20 force @a
kill @e[tag=hook.s1spent]
execute if score #st hook.b1 matches 9 run return run function hook:boss/1/end
execute unless score #st hook.b1 matches 1..6 run return 0
execute if score #inv hook.b1 matches 1.. run scoreboard players remove #inv hook.b1 1
execute in hook:world unless entity @a[scores={hook.stage=1},x=311,y=60,z=-20,dx=48,dy=43,dz=40] run return run function hook:boss/1/reset
execute unless entity @e[tag=hook.boss1] run return run function hook:boss/1/reset
execute as @e[tag=hook.boss1,limit=1] at @s run function hook:boss/1/ai
