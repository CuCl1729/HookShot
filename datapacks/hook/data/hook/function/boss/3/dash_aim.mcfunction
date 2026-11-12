#> hook:boss/3/dash_aim
# @s = 王。実行の向き(水平)を突進の向きとして目印に残し、王もそちらを向く(ゾンビの首振りで王の向きは当てにならない)
summon marker ~ ~ ~ {Tags:["hook.b3x","hook.b3dir"]}
tp @n[tag=hook.b3dir] ~ ~ ~ ~ ~
tp @s ~ ~ ~ ~ ~
playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 3 0.7
