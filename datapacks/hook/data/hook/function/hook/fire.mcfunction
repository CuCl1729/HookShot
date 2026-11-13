#> hook:hook/fire
# @s = プレイヤー(実行位置・向きも @s)。敵を掴んでいれば投げる。それ以外は視線方向へ即着弾のレイ(射程 #range)
# 引き寄せ中に撃ち直すと、当たれば今の引きの速さのまま新しい標的へ(溜めなし、#repull = 引き継ぐ速さ)。外れたら離すだけ(速度はそのまま = 慣性で飛ぶ)
execute if entity @e[tag=hook.grabbed] run return run function hook:combat/throw
scoreboard players set #repull hook.temporary 0
execute if entity @s[tag=hook.pulling] if score @s hook.pull > #windup hook.cfg run scoreboard players operation #repull hook.temporary = @s hook.spd
function hook:hook/release
playsound minecraft:item.crossbow.shoot player @a ~ ~ ~ 1 1.4
scoreboard players operation #ray hook.temporary = #range hook.cfg
execute anchored eyes positioned ^ ^ ^0.5 anchored feet run function hook:hook/ray
tag @e[tag=hook.hit] remove hook.hit