#> hook:boss/2/act/charge
# @s = 番人(実行位置も)。突進: t=1 でプレイヤーへの向きを固定 → #tel tick 予告(床に炎の線)→ 0.9 ブロック/tick で最大 34 tick 直進。
# 壁にぶつかったら 5 秒動けない(壁際のプレスの前で誘えば、そのままプレスの下で止まる)。HP1 は走り切ると続けてもう一度
execute if score #t hook.b2 matches 1 run scoreboard players set #hitp hook.b2 0
execute if score #t hook.b2 matches 1 run summon marker ~ ~ ~ {Tags:["hook.b2dir","hook.b2m"]}
execute if score #t hook.b2 matches 1 as @e[type=marker,tag=hook.b2dir] at @s facing entity @p[scores={hook.stage=2}] feet run tp @s ~ ~ ~ ~ 0
execute if score #t hook.b2 matches 1 rotated as @e[type=marker,tag=hook.b2dir,limit=1] run tp @s ~ ~ ~ ~ 0
execute if score #t hook.b2 matches 1 run playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 2 1.2
execute if score #t hook.b2 <= #tel hook.b2 rotated as @e[type=marker,tag=hook.b2dir,limit=1] run function hook:boss/2/act/charge_line
execute if score #t hook.b2 <= #tel hook.b2 run return 0
# 前(左右の肩も)が壁なら激突
execute rotated as @e[type=marker,tag=hook.b2dir,limit=1] positioned ^ ^ ^1.6 unless block ~ ~0.5 ~ #hook:pass run return run function hook:boss/2/act/crash
execute rotated as @e[type=marker,tag=hook.b2dir,limit=1] positioned ^0.6 ^ ^1.6 unless block ~ ~0.5 ~ #hook:pass run return run function hook:boss/2/act/crash
execute rotated as @e[type=marker,tag=hook.b2dir,limit=1] positioned ^-0.6 ^ ^1.6 unless block ~ ~0.5 ~ #hook:pass run return run function hook:boss/2/act/crash
execute rotated as @e[type=marker,tag=hook.b2dir,limit=1] run tp @s ^ ^ ^0.9
particle minecraft:large_smoke ~ ~0.5 ~ 0.4 0.2 0.4 0 3 force @a
execute if score #hitp hook.b2 matches 0 at @s if entity @a[scores={hook.stage=2},distance=..2.6] run function hook:boss/2/act/ram
scoreboard players operation #e hook.b2 = #tel hook.b2
scoreboard players add #e hook.b2 34
execute if score #t hook.b2 < #e hook.b2 run return 0
execute if score #hp hook.b2 matches ..1 if score #dbl hook.b2 matches 0 run return run function hook:boss/2/act/again
function hook:boss/2/set {a:0}
