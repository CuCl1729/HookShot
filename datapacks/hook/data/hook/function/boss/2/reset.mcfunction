#> hook:boss/2/reset
# hook:world で実行。ボス戦を待機に戻す(番人・目印・呼んだ雑魚・撃破後の欠片を消し、入口を開け、ボスバーを消す)。地形が無くても害はない
scoreboard players set #state hook.b2 0
scoreboard players set #got hook.b2 0
kill @e[tag=hook.boss2]
kill @e[tag=hook.b2m]
kill @e[tag=hook.s2bm]
kill @e[tag=hook.b2s]
fill 840 76 -1 842 79 1 minecraft:air
fill 819 64 -1 819 66 1 minecraft:air
function hook:core/call {f:"hook:boss/2/bar_hide"}
