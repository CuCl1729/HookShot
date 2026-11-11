#> hook:gimmick/press/tick
# 動作中のプレスを進める。プレスを置いたステージの tick から毎 tick 呼ぶ
execute as @e[type=marker,tag=hook.press,scores={hook.press=1..}] at @s run function hook:gimmick/press/step
