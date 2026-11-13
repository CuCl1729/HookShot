#> hook:boss/2/defeat
# @s = 倒された番人。撃破演出のあと、宙に現れる欠片を鉤で撃つと 2/3 → 能力2 → 評価 → ステージ3(hook:boss/2/post)
scoreboard players set #state hook.b2 2
scoreboard players set #t hook.b2 0
scoreboard players set #got hook.b2 0
scoreboard players set #w hook.b2 0
function hook:core/call {f:"hook:boss/2/bar_hide"}
kill @e[tag=hook.b2m]
kill @e[tag=hook.s2bm]
function hook:score/stop
function hook:fx/boss_clear
kill @s
