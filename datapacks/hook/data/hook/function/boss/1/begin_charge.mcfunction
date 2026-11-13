#> hook:boss/1/begin_charge
# 突進の予告を始める。向きは目印 hook.b1dir(予告の最後 14 tick は固定)
kill @e[type=marker,tag=hook.b1dir]
summon marker ~ ~ ~ {Tags:["hook.b1dir","hook.s1"]}
scoreboard players set #st hook.b1 2
scoreboard players set #t hook.b1 30
execute if score #ph hook.b1 matches 2 run scoreboard players set #t hook.b1 24
scoreboard players set #lk hook.b1 14
function hook:boss/1/tele
playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 2 0.6
