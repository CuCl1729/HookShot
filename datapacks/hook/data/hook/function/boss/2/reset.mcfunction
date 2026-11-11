#> hook:boss/2/reset
# hook:world で実行。ボス戦を待機に戻す(番人を消し、入口を開け、ボスバーを消す)
scoreboard players set #state hook.b2 0
kill @e[tag=hook.boss2]
fill 819 76 -1 819 78 1 minecraft:air
function hook:core/call {f:"hook:boss/2/bar_hide"}
