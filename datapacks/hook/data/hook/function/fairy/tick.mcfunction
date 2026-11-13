#> hook:fairy/tick
# @s = tag hook.lumi のプレイヤー(実行位置も @s。core の tick から)。ルミを目の左前へ連れて歩く(teleport_duration 1 でなめらかに付いてくる)
# 遠くに取り残されたルミ(テレポートの前の場所。読み込まれ直したときに見える)は消して出し直す
kill @e[type=item_display,tag=hook.fairy,distance=24..]
execute unless entity @e[type=item_display,tag=hook.fairy,distance=..24] run function hook:fairy/spawn
# 目の左前(照準から約 28° 左・7° 上、1.5 先)。一人称でも視界の左端に入る。視線ごと(上下も)付いてくる
# 表示は 1 tick 遅れて描かれるので、速く動いている間(引き)は速度 2 tick 分先へ置く(#vx/#vy/#vz は同じ tick の player/vel)
execute store result storage hook: tmp.lx double 0.02 run scoreboard players get #vx hook.temporary
execute store result storage hook: tmp.ly double 0.02 run scoreboard players get #vy hook.temporary
execute store result storage hook: tmp.lz double 0.02 run scoreboard players get #vz hook.temporary
# ふわふわ: #tick(0〜99)の前半と後半で高さを変える
execute if score #tick hook.temporary matches ..49 anchored eyes positioned ^0.8 ^0.14 ^1.5 run function hook:fairy/place with storage hook: tmp
execute if score #tick hook.temporary matches 50.. anchored eyes positioned ^0.8 ^0.22 ^1.5 run function hook:fairy/place with storage hook: tmp
# 光の粉(欠片が多いほど多い)
scoreboard players operation #m hook.temporary = #tick hook.temporary
scoreboard players operation #m hook.temporary %= #4 hook.constant
execute if score #m hook.temporary matches 0 as @e[type=item_display,tag=hook.fairy,distance=..26] at @s run function hook:fairy/dust
execute if score #tick hook.temporary matches 0 as @e[type=item_display,tag=hook.fairy,distance=..26] run function hook:fairy/look
