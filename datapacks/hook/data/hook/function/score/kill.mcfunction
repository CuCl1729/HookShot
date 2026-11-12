#> hook:score/kill
# 雑魚を1体倒した(hook:enemy/kill から)。キル数とコンボ(#combo_t tick 以内の連続撃破)を数える
scoreboard players add #kills hook.score 1
scoreboard players add #combo hook.score 1
scoreboard players operation #combo_t hook.score = #combo_t hook.cfg
execute if score #combo hook.score > #combo_max hook.score run scoreboard players operation #combo_max hook.score = #combo hook.score
execute if score #combo hook.score matches 2.. run function hook:score/combo
