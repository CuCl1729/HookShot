#> hook:dev/inbox_on
# 開発用 inbox を有効にする(最初の1回だけ手で /function hook:dev/inbox_on)。今ある body は実行済み扱い
scoreboard objectives add hook.dev dummy
function hook:dev/inbox_seq
scoreboard players operation #done hook.dev = #seq hook.dev
scoreboard players set #t hook.dev 0
scoreboard players set #hold hook.dev 0
scoreboard players set #inbox hook.dev 1
tellraw @a "MCIN on"
