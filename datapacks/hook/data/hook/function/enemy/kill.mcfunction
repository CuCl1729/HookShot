#> hook:enemy/kill
# @s = 倒す敵(実行位置も @s)。無条件に倒す(ギミックからは hook:enemy/gimmick 経由)。ボスは hook:boss/hit に回す。
# 雑魚はキル数・コンボを数え(hook:score/kill)、爆弾兵なら爆発して周りの敵も倒す
execute if entity @s[tag=hook.boss] run return run function hook:boss/hit
execute if entity @s[tag=hook.dying] run return 0
tag @s add hook.dying
particle minecraft:explosion ~ ~0.5 ~ 0 0 0 0 1 force @a
playsound minecraft:entity.generic.hurt hostile @a ~ ~ ~ 1 0.6
function hook:score/kill
execute if entity @s[tag=hook.bomb] run function hook:enemy/explode
kill @s
