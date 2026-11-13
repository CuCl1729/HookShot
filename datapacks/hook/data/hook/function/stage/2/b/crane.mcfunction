#> hook:stage/2/b/crane
# hook:world で 8 tick ごと。クレーンの台(5x2x5 の実ブロック。フックが当たる。跳ねで越えないよう奥行き 5)を z に 1 マス動かす。
# 中心 z 20〜-18 を往復(hook.s2fwd = 北 -z へ)。台は実行位置ごと消して描き直す。乗っていても運ばれない(乗り継ぎ専用)
# 範囲は x y z を全部書く(marker は大きさ 0。省いた軸は実行位置が端になり交差判定が外れて、台が止まらず飛んでいく)
scoreboard players set #kt hook.s2 0
execute as @e[type=marker,tag=hook.s2crane] if entity @s[x=750,y=90,z=-30,dx=20,dy=20,dz=12.6] run tag @s remove hook.s2fwd
execute as @e[type=marker,tag=hook.s2crane] if entity @s[x=750,y=90,z=19.4,dx=20,dy=20,dz=10] run tag @s add hook.s2fwd
execute as @e[type=marker,tag=hook.s2crane,tag=hook.s2fwd] at @s run tp @s ~ ~ ~-1
execute as @e[type=marker,tag=hook.s2crane,tag=!hook.s2fwd] at @s run tp @s ~ ~ ~1
fill 758 102 -21 762 103 23 minecraft:air
execute at @e[type=marker,tag=hook.s2crane] run fill ~-2 ~ ~-2 ~2 ~1 ~2 minecraft:yellow_concrete
execute at @e[type=marker,tag=hook.s2crane] as @e[type=block_display,tag=hook.s2chain] run tp @s ~-0.5 ~2 ~-0.5
