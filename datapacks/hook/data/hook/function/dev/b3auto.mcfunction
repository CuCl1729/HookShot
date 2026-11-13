#> hook:dev/b3auto
# 試験用(schedule から毎 tick、#trap hook.dev tick まで)。ラスボス戦の手下投げを人の代わりに繰り返す:
# 何も掴んでいなければ近い手下(爆弾兵を優先)を実フックで撃ち、掴んだら王が 5 より離れている tick に王へ投げる。撃つのは 20 tick に 1 回まで
scoreboard players remove #trap hook.dev 1
execute if score #trap hook.dev matches ..0 run return run tellraw @a "b3auto end"
schedule function hook:dev/b3auto 1t
execute unless score #state hook.b3 matches 1..3 run return 0
scoreboard players remove #cool hook.dev 1
execute if score #cool hook.dev matches 1.. run return 0
execute as @a[limit=1] if entity @s[tag=hook.pulling] run return 0
tag @e[tag=dev.y] remove dev.y
tag @e[tag=hook.boss3] add dev.y
# 怯んだ王: 近いトゲの島の反対側 12 マスへ回り込み(tp = 歩く代わり)、王へ飛び込んで突き飛ばす(能力1)
execute if score #stag hook.b3 matches 20.. unless entity @e[tag=hook.grabbed] run return run function hook:dev/b3auto_ram
execute if entity @e[tag=hook.grabbed] as @a[limit=1] at @s unless entity @e[tag=hook.boss3,distance=..5] run return run function hook:dev/b3auto_throw
execute if entity @e[tag=hook.grabbed] run return 0
tag @e[tag=dev.z] remove dev.z
execute as @a[limit=1] at @s run tag @n[tag=hook.b3m,tag=hook.bomb,distance=..35] add dev.z
execute unless entity @e[tag=dev.z] as @a[limit=1] at @s run tag @n[tag=hook.b3m,distance=..35] add dev.z
execute unless entity @e[tag=dev.z] run return 0
scoreboard players set #cool hook.dev 20
execute as @a[limit=1] at @s run function hook:dev/aim_at {tag:"dev.z"}
