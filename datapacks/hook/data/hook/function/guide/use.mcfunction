#> hook:guide/use
# @s = ルミの鈴で右クリックしているプレイヤー(進捗 hook:bell から。押し続けている間は毎 tick 来る)。押した瞬間だけ聞く
advancement revoke @s only hook:bell
# 押したまま持ち替えてもフックが撃たれないように(hook/use は hook.held 1.. の間は撃たない)
scoreboard players set @s hook.held 2
execute if score @s hook.bell matches 1.. run return run scoreboard players set @s hook.bell 2
scoreboard players set @s hook.bell 2
execute at @s run function hook:guide/ask
