#> hook:boss/3/defeat
# @s = 怯んだまま奈落へ落ちた王。後始末をしてエンディングへ(以降 stage/4/tick は呼ばれない)
scoreboard players set #state hook.b3 4
function hook:core/call {f:"hook:boss/3/bar_hide"}
function hook:score/stop
execute as @e[tag=hook.b3m] at @s run function hook:boss/3/fade
kill @e[tag=hook.b3x]
tag @a remove hook.b3hit
# とどめ: 落ちた所の真上(闘技場の高さ)で撃破演出。王はもう奈落の底なので y は 64 に
execute in hook:world positioned as @s positioned ~ 64 ~ run particle minecraft:reverse_portal ~ ~-4 ~ 1.5 6 1.5 0.8 300 force @a
execute in hook:world positioned as @s positioned ~ 64 ~ run playsound minecraft:entity.wither.death hostile @a ~ ~ ~ 4 0.8
execute in hook:world positioned as @s positioned ~ 64 ~ run function hook:fx/boss_clear
tellraw @a[scores={hook.stage=4}] {text:"虚の王は、奈落の底へ消えていった。",color:"gray",italic:true}
kill @s
execute as @a[scores={hook.stage=4}] run function hook:stage/5/start
