#> hook:boss/1/next
# 次の技。第1段階: 突進・突進・水晶落とし / 第2段階: 突進・踏みつけ・水晶落とし・突進
scoreboard players add #n hook.b1 1
scoreboard players operation #k hook.b1 = #n hook.b1
execute if score #ph hook.b1 matches 1 run scoreboard players operation #k hook.b1 %= #3 hook.constant
execute if score #ph hook.b1 matches 2 run scoreboard players operation #k hook.b1 %= #4 hook.constant
execute if score #k hook.b1 matches 2 run return run function hook:boss/1/begin_rain
execute if score #k hook.b1 matches 1 if score #ph hook.b1 matches 2 run return run function hook:boss/1/begin_stomp
function hook:boss/1/begin_charge
