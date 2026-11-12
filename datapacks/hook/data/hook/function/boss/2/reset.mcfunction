#> hook:boss/2/reset
# hook:world で実行。ボス戦を待機に戻す(番人・目印・呼んだ雑魚を消し、入口を開け、ボスバーを消す)。地形が無くても害はない
scoreboard players set #state hook.b2 0
kill @e[tag=hook.boss2]
kill @e[tag=hook.b2m]
kill @e[tag=hook.s2bm]
fill 819 64 -1 819 66 1 minecraft:air
function hook:core/call {f:"hook:boss/2/bar_hide"}
