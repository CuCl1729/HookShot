# 訓練場は hook:tick が built.s0 の立つまで自動で建てる(forceload は hook:load / stage/0/build が行う)。目印が見え built が立つまで待つ
data remove storage hook: built.s0
scoreboard players set #w0 hook.temporary 0
scoreboard players set #rdy0 hook.temporary 0
function hooktest:stage0/poll
