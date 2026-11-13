# ステージ 4 の build を、チャンクが読み込まれるまで毎 tick 呼ぶ(各ステージの tick が実プレイで行うのと同じ)
forceload add 1496 -32 1599 31
scoreboard players set #w4 hook.temporary 0
scoreboard players set #rdy4 hook.temporary 0
data remove storage hook: built.s4
function hooktest:stage4/poll
