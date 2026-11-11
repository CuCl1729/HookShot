#> hook:stage/2/gate
# @s = プレイヤー。@macro x: 門(鉄格子 z -1〜1, y 64〜66)を開ける
$fill $(x) 64 -1 $(x) 66 1 minecraft:air
$playsound minecraft:block.iron_door.open block @a $(x) 65 0 2 0.7
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s {text:"鉄格子が上がった。",color:"gray",italic:true}
