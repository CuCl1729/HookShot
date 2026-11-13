# hook.b2 は load でなく hook:stage/2/start が作る(ここでは start を通さないので自分で作る)
# ステージ 2 の build を、チャンクが読み込まれるまで毎 tick 呼ぶ(各ステージの tick が実プレイで行うのと同じ)
scoreboard objectives add hook.b2 dummy
forceload add 600 -64 900 63
scoreboard players set #w2 hook.temporary 0
scoreboard players set #rdy2 hook.temporary 0
data remove storage hook: built.s2
function hooktest:stage2/poll
