#> hook:hook/use
# @s = フックショットで右クリックしているプレイヤー(進捗 hook:right_click から。押し続けている間は毎 tick 来る)
# 押した瞬間だけ撃つ(押しっぱなしで掴んだ敵をすぐ投げないように)。クールダウンは無い
advancement revoke @s only hook:right_click
execute if score @s hook.held matches 1.. run return run scoreboard players set @s hook.held 2
scoreboard players set @s hook.held 2
execute at @s run function hook:hook/fire
