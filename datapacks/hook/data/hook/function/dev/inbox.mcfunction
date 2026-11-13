#> hook:dev/inbox
# load から(#inbox hook.dev = 1 のときだけ)。tools/mcrun.mjs が書いた inbox_seq の番号が実行済み(#done)より大きいときだけ inbox_body を1回、プレイヤーとして実行する
function hook:dev/inbox_seq
execute unless score #seq hook.dev > #done hook.dev run return 0
scoreboard players operation #done hook.dev = #seq hook.dev
# reload 直後はクライアントも再同期で止まるので、少し待ってから実行する(実測: reload 中に撃つと push がまとめて効き 100 マス飛んだ)
schedule function hook:dev/inbox_run 20t replace
