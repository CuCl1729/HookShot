#> hook:boss/1/reset
# ボス戦を始める前の状態へ(冪等。stage/1/build・start、core/reset、撃破後から)。巨兵・雑魚・目印を消し、バーを隠し、トゲを置き直す
kill @e[tag=hook.boss1]
kill @e[tag=hook.s1m1]
kill @e[tag=hook.s1m2]
kill @e[type=marker,tag=hook.b1dir]
kill @e[type=marker,tag=hook.b1rain]
scoreboard players set #st hook.b1 0
function hook:core/call {f:"hook:boss/1/bar_hide"}
execute in hook:world run fill 311 71 -20 359 71 20 minecraft:air replace minecraft:amethyst_cluster
function hook:boss/1/spikes
