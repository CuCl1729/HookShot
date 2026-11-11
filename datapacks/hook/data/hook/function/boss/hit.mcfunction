#> hook:boss/hit
# @s = ギミックに触れたボス(実行位置も @s)。hook:enemy/kill から毎 tick 来うる。タグでボスごとに振り分ける
# (2・3 は読み込み時に無くても壊れないよう hook:core/call 経由)
execute if entity @s[tag=hook.boss1] run return run function hook:boss/1/hit
execute if entity @s[tag=hook.boss2] run return run function hook:core/call {f:"hook:boss/2/hit"}
execute if entity @s[tag=hook.boss3] run return run function hook:core/call {f:"hook:boss/3/hit"}
