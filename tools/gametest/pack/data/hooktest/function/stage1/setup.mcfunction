# ステージ 1 の build を、チャンクが読み込まれるまで毎 tick 呼ぶ(各ステージの tick が実プレイで行うのと同じ)
forceload add 192 -64 511 63
scoreboard players set #w1 hook.temporary 0
scoreboard players set #rdy1 hook.temporary 0
data remove storage hook: built.s1
function hooktest:stage1/poll
