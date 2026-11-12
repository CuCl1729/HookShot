#> hook:score/ding
# @macro p = 音の高さ
$execute as @a at @s run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 $(p)
$execute as @a at @s run playsound minecraft:block.note_block.pling player @s ~ ~ ~ 0.6 $(p)
