#> hook:score/start
# 集計を 0 から始める(キル数 #kills・経過 tick #time・最大コンボ #combo_max。すべて hook.score の偽プレイヤー・倒れた回数 #sdeaths)
scoreboard players set #kills hook.score 0
scoreboard players set #time hook.score 0
scoreboard players set #combo_max hook.score 0
scoreboard players set #run hook.score 1
scoreboard players set #sdeaths hook.score 0
