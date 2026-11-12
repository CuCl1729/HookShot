#> hook:stage/3/ta/fail
# in hook:world。時間切れ(または途中で落ちた)
function hook:stage/3/ta/clear
particle minecraft:cloud 1070 88 -36 12 6 6 0.02 80 force @a
title @a[scores={hook.stage=3}] actionbar {text:"環が消えた。広場の北端の標的を撃てば、もう一度",color:"gray"}
