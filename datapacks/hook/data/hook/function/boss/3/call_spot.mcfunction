#> hook:boss/3/call_spot
# @s = 王。実行位置が立てる場所(足元と頭が空気、下が床)なら出現点を置き、だめなら王の足元に置く
execute if block ~ ~ ~ minecraft:air if block ~ ~1 ~ minecraft:air unless block ~ ~-1 ~ minecraft:air run return run summon marker ~ ~ ~ {Tags:["hook.b3x","hook.b3s","hook.b3new"]}
execute at @s run summon marker ~ ~ ~ {Tags:["hook.b3x","hook.b3s","hook.b3new"]}
