#> hook:stage/1/gate
# @s = プレイヤー。@macro x: 開ける格子の x
$execute in hook:world run fill $(x) 64 1 $(x) 76 14 minecraft:air
playsound minecraft:block.amethyst_block.chime master @s ~ ~ ~ 1 1
tellraw @s {text:"格子が開いた。",color:"gray"}
