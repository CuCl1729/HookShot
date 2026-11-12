#> hook:boss/1/minion
# 10 秒ごとに南北の壁際へ投げる用の雑魚(各1体まで。第2段階は南が爆弾兵)
scoreboard players set #mt hook.b1 0
execute unless entity @e[tag=hook.s1m1] run function hook:stage/1/spawn {k:"zombie",x:335.5,y:71,z:18.5,t:"hook.s1m1"}
execute if score #ph hook.b1 matches 1 unless entity @e[tag=hook.s1m2] run function hook:stage/1/spawn {k:"zombie",x:335.5,y:71,z:-18.5,t:"hook.s1m2"}
execute if score #ph hook.b1 matches 2 unless entity @e[tag=hook.s1m2] run function hook:stage/1/spawn {k:"bomber",x:335.5,y:71,z:-18.5,t:"hook.s1m2"}
