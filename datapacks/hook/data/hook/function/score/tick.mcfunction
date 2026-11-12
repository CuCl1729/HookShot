#> hook:score/tick
# 毎 tick(core の tick から)。コンボの残り時間と、計測中(#run 1)の経過 tick
execute if score #combo_t hook.score matches 1.. run scoreboard players remove #combo_t hook.score 1
execute if score #combo_t hook.score matches 0 run scoreboard players set #combo hook.score 0
execute if score #run hook.score matches 1 run scoreboard players add #time hook.score 1
