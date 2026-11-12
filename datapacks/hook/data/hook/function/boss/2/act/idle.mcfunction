#> hook:boss/2/act/idle
# @s = 番人。#idle 待って次の行動を選ぶ。HP3: 突進→跳躍 の繰り返し / HP2 以下: 突進→跳躍→呼び出し(雑魚が2体以上いれば跳躍)
execute if score #t hook.b2 < #idle hook.b2 run return 0
scoreboard players add #n hook.b2 1
scoreboard players operation #m hook.b2 = #n hook.b2
execute if score #hp hook.b2 matches 3.. run scoreboard players operation #m hook.b2 %= #c2 hook.b2
execute if score #hp hook.b2 matches ..2 run scoreboard players operation #m hook.b2 %= #c3 hook.b2
scoreboard players set #dbl hook.b2 0
execute store result score #k hook.b2 if entity @e[tag=hook.s2bm]
execute if score #m hook.b2 matches 2 if score #k hook.b2 matches 2.. run scoreboard players set #m hook.b2 1
execute if score #m hook.b2 matches 0 run return run function hook:boss/2/set {a:1}
execute if score #m hook.b2 matches 1 run return run function hook:boss/2/set {a:2}
function hook:boss/2/set {a:3}
