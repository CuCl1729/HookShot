#> hook:combat/smash_hit
# @s = 弾かれて飛んでいて他の敵に触れた敵(tag hook.self)。相手を弾き、自分は水平に止まって怯む(ビリヤードの手球)
function hook:combat/smash_enemy
data modify entity @s Motion[0] set value 0d
data modify entity @s Motion[2] set value 0d
function hook:combat/slam
