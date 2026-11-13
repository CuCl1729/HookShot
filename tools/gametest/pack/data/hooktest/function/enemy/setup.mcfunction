# 敵の召喚(x 3000〜3030, z 3000)。目印が見えるようになってから(チャンクの準備待ち)
forceload add 2990 2990 3050 3010
scoreboard players set #we hook.temporary 0
scoreboard players set #rdye hook.temporary 0
function hooktest:enemy/poll
