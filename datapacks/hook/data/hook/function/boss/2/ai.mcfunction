#> hook:boss/2/ai
# @s = 番人(実行位置も)。#act: 0 間 / 1 突進 / 2 跳躍 / 3 呼び出し / 4 潰された後 / 9 動けない。#t = その行動の経過 tick
# 突き飛ばされたら(能力1)行動を打ち切って 5 秒動けない
execute if entity @s[tag=hook.impacted] run function hook:boss/2/daze
scoreboard players add #t hook.b2 1
execute if score #act hook.b2 matches 0 run return run function hook:boss/2/act/idle
execute if score #act hook.b2 matches 1 run return run function hook:boss/2/act/charge
execute if score #act hook.b2 matches 2 run return run function hook:boss/2/act/leap
execute if score #act hook.b2 matches 3 run return run function hook:boss/2/act/summon
execute if score #act hook.b2 matches 4 run return run function hook:boss/2/act/crushed
execute if score #act hook.b2 matches 9 run return run function hook:boss/2/act/dazed
