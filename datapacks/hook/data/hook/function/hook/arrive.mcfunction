#> hook:hook/arrive
# @s = 錨の手前に着いた(または時間切れ・詰まりの)プレイヤー。実行位置・向きも @s。#y1/#vx/#vy/#vz は player/vel から
# 慣性を消して、見ている水平方向へ小さく跳ねる。錨が足より上にあるほど高く跳ぶ(壁の上端を撃てば天面に乗れる)
# 能力1 ヘビーインパクト: 重い敵に突っ込んだら、その敵を進行方向へ突き飛ばす
execute if score @s hook.ability matches 1.. as @e[tag=hook.anchor,tag=hook.heavy] at @s run function hook:hook/impact
# 上 = #hop_vy + (錨の高さ − 足の高さ)/#hop_dy(#hop_vymax まで)
execute store result score #ay hook.temporary run data get entity @n[tag=hook.anchor] Pos[1] 100
scoreboard players operation #ay hook.temporary -= #y1 hook.temporary
execute if score #ay hook.temporary matches ..-1 run scoreboard players set #ay hook.temporary 0
scoreboard players operation #ay hook.temporary /= #hop_dy hook.cfg
scoreboard players operation #ay hook.temporary += #hop_vy hook.cfg
execute if score #ay hook.temporary > #hop_vymax hook.cfg run scoreboard players operation #ay hook.temporary = #hop_vymax hook.cfg
# 横 = 見ている水平方向 × #hop_h
execute rotated ~ 0 run function hook:util/dir
scoreboard players operation @s hook.hx = #dx hook.temporary
scoreboard players operation @s hook.hz = #dz hook.temporary
scoreboard players operation @s hook.hx *= #hop_h hook.cfg
scoreboard players operation @s hook.hz *= #hop_h hook.cfg
scoreboard players operation @s hook.hx /= #1000 hook.constant
scoreboard players operation @s hook.hz /= #1000 hook.constant
# + 着く直前の水平の勢い × #hop_keep / 100(引かれてきた向きへ少し流れる)
scoreboard players operation #kx hook.temporary = #cx hook.temporary
scoreboard players operation #kz hook.temporary = #cz hook.temporary
scoreboard players operation #kx hook.temporary *= #hop_keep hook.cfg
scoreboard players operation #kz hook.temporary *= #hop_keep hook.cfg
scoreboard players operation #kx hook.temporary /= #100 hook.constant
scoreboard players operation #kz hook.temporary /= #100 hook.constant
scoreboard players operation @s hook.hx += #kx hook.temporary
scoreboard players operation @s hook.hz += #kz hook.temporary
scoreboard players operation @s hook.hy = #ay hook.temporary
# この tick から #hop_t tick かけて、その速度に寄せる(hook:hook/hop_tick)
scoreboard players operation @s hook.hop = #hop_t hook.cfg
function hook:hook/hop_tick
scoreboard players operation @s hook.fuel = #fuel hook.cfg
playsound minecraft:entity.bat.takeoff player @a ~ ~ ~ 0.8 1.4
playsound minecraft:block.chain.place player @a ~ ~ ~ 1 0.8
particle minecraft:cloud ~ ~ ~ 0.3 0.1 0.3 0.02 6 force @a
execute if entity @s[tag=hook.rec] run function hook:dev/rec_arrive
function hook:hook/release
