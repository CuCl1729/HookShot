#> hook:hook/hit_entity
# @s = プレイヤー。tag=hook.hit = 当たった敵(実行位置に一番近いものを使う)
execute at @s run playsound minecraft:entity.fishing_bobber.retrieve player @a ~ ~ ~ 1 1
particle minecraft:electric_spark ~ ~ ~ 0.2 0.2 0.2 0 10 force @a
# 能力2 スタンチェイン
execute if score @s hook.ability matches 2.. as @n[tag=hook.hit] run function hook:hook/stun
# 重い敵 → 自分が引かれる
execute if entity @n[tag=hook.hit,tag=hook.heavy] run return run function hook:hook/grab_heavy
# 軽い敵 → 敵を引き寄せる
execute store result score #px hook.temporary run data get entity @s Pos[0] 100
execute store result score #py hook.temporary run data get entity @s Pos[1] 100
execute store result score #pz hook.temporary run data get entity @s Pos[2] 100
execute as @n[tag=hook.hit] run function hook:hook/yank
# tag hook.yanked = 軽い敵を引いたことがある(訓練場が読む)
tag @s add hook.yanked
