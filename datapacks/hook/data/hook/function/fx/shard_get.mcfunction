#> hook:fx/shard_get
# @macro n: 取り戻した欠片の数(1〜3)。#shards hook.score を n にし、title「太陽石の欠片 n/3」・ファンファーレ・ルミが明るく大きくなる・ルミの一言・サイドバー更新
# ボス撃破後は fx/boss_clear の余韻(約 4 秒)が終わってから呼ぶ(例: schedule で 80t 後)
$scoreboard players set #shards hook.score $(n)
title @a times 10 70 20
$title @a subtitle {text:"$(n) / 3",color:"yellow",bold:true}
title @a title {text:"太陽石の欠片",color:"gold",bold:true}
$tellraw @a [{text:"太陽石の欠片 ",color:"gold"},{text:"$(n)/3",color:"yellow",bold:true}]
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute as @a at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.6 1 0.6 0.5 100 force @s
execute as @e[type=item_display,tag=hook.fairy] run function hook:fairy/look
execute as @e[type=item_display,tag=hook.fairy] at @s run particle minecraft:end_rod ~ ~ ~ 0.2 0.2 0.2 0.15 60 force @a
schedule function hook:fx/shard_2 8t
schedule function hook:fx/shard_3 18t
function hook:guide/refresh
execute if score #shards hook.score matches 1 run function hook:fairy/say {text:"ひとつ目！ あったかい……わたし、少し明るくなったでしょ？"}
execute if score #shards hook.score matches 2 run function hook:fairy/say {text:"ふたつ目！ あとひとつだよ"}
execute if score #shards hook.score matches 3.. run function hook:fairy/say {text:"三つ揃った……！ 光が戻ってくるよ！"}
