# ステージ 3 の build を、チャンクが読み込まれるまで毎 tick 呼ぶ(各ステージの tick が実プレイで行うのと同じ)
forceload add 1000 -48 1300 47
scoreboard players set #w3 hook.temporary 0
scoreboard players set #rdy3 hook.temporary 0
data remove storage hook: built.s3
function hooktest:stage3/poll
