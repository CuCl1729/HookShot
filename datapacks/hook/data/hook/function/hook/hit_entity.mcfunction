#> hook:hook/hit_entity
# @s = プレイヤー。tag=hook.hit = 当たった敵(実行位置に一番近いものを使う)。当てた時点でフロートの燃料を満タンに
scoreboard players operation @s hook.fuel = #fuel hook.cfg
execute at @s run playsound minecraft:entity.fishing_bobber.retrieve player @a ~ ~ ~ 1 1
particle minecraft:electric_spark ~ ~ ~ 0.2 0.2 0.2 0 10 force @a
# 能力2 スタンチェイン
execute if score @s hook.ability matches 2.. as @n[tag=hook.hit] run function hook:hook/stun
# 重い敵 → 自分が引かれる
execute if entity @n[tag=hook.hit,tag=hook.heavy] run return run function hook:hook/grab_heavy
# 軽い敵 → 目の前まで引き寄せて掴む(引き寄せ中の別の敵は放す)。tag hook.owner = 引き寄せ・掴みの主
execute as @e[tag=hook.yanking] run function hook:combat/drop
tag @s add hook.owner
execute as @n[tag=hook.hit] run function hook:combat/yank_start
# tag hook.yanked = 軽い敵を引いたことがある(訓練場が読む)
tag @s add hook.yanked
