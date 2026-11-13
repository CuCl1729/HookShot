#> hook:boss/1/shot
# @s = 欠片の標的のスイッチ(hook:hook/switch から)。欠片が手元へ飛んで 1/3(写し元: stage/5/shot)
execute unless score #st hook.b1 matches 9 run return 0
execute if score #shot hook.b1 matches 1 run return 0
scoreboard players set #shot hook.b1 1
kill @s
execute in hook:world run fill 334 78 -1 336 81 1 minecraft:air
execute as @a[scores={hook.stage=1}] at @s facing 335.5 79.5 0.5 run particle minecraft:end_rod ^ ^1.5 ^2 0.2 0.2 0.2 0.15 60 force @a
execute in hook:world run particle minecraft:end_rod 335.5 79.5 0.5 1 1 1 0.3 100 force @a
function hook:fx/shard_get {n:1}
function hook:guide/set {text:"ひと息ついたら次の地へ",x:335,y:71,z:0}
