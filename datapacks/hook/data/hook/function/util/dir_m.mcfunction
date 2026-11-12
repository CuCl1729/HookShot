#> hook:util/dir_m
# @s = hook:util/dir の目印(実行位置・向きは呼び出し元のまま)
execute store result score #dx hook.temporary run data get entity @s Pos[0] -1000
execute store result score #dy hook.temporary run data get entity @s Pos[1] -1000
execute store result score #dz hook.temporary run data get entity @s Pos[2] -1000
tp @s ^ ^ ^1
execute store result score #a hook.temporary run data get entity @s Pos[0] 1000
scoreboard players operation #dx hook.temporary += #a hook.temporary
execute store result score #a hook.temporary run data get entity @s Pos[1] 1000
scoreboard players operation #dy hook.temporary += #a hook.temporary
execute store result score #a hook.temporary run data get entity @s Pos[2] 1000
scoreboard players operation #dz hook.temporary += #a hook.temporary
kill @s
