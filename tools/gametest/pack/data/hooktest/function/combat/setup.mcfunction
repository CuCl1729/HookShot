# 投げの新ルール(x 3100〜3135, z 2995〜3005)。目印が見えるようになってから(チャンクの準備待ち)
forceload add 3095 2990 3140 3010
scoreboard players set #wc hook.temporary 0
scoreboard players set #rdyc hook.temporary 0
scoreboard players set #sc hook.temporary 0
function hooktest:combat/poll
