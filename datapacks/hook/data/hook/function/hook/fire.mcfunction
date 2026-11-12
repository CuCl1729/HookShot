#> hook:hook/fire
# @s = プレイヤー(実行位置・向きも @s)。敵を掴んでいれば投げる。それ以外は視線方向へ即着弾のレイ(射程 #range)
execute if entity @e[tag=hook.grabbed] run return run function hook:combat/throw
function hook:hook/release
playsound minecraft:item.crossbow.shoot player @a ~ ~ ~ 1 1.4
scoreboard players operation #ray hook.temporary = #range hook.cfg
execute anchored eyes positioned ^ ^ ^0.5 anchored feet run function hook:hook/ray
tag @e[tag=hook.hit] remove hook.hit
