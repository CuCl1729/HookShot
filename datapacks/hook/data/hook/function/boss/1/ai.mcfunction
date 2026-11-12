#> hook:boss/1/ai
# @s = 巨兵(実行位置も)。状態ごとの処理
scoreboard players remove #t hook.b1 1
scoreboard players add #mt hook.b1 1
execute if score #mt hook.b1 matches 200.. run function hook:boss/1/minion
execute if score #st hook.b1 matches 1 if score #t hook.b1 matches ..0 run return run function hook:boss/1/next
execute if score #st hook.b1 matches 2 run return run function hook:boss/1/wind_charge
execute if score #st hook.b1 matches 3 run return run function hook:boss/1/charge
execute if score #st hook.b1 matches 4 run return run function hook:boss/1/wind_rain
execute if score #st hook.b1 matches 5 run return run function hook:boss/1/stunned
execute if score #st hook.b1 matches 6 run return run function hook:boss/1/wind_stomp
