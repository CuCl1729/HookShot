#> hook:stage/3/bell/s
# @s = 南の鐘の標的のスイッチ
execute if score #s hook.s3 matches 1 run return 0
scoreboard players set #s hook.s3 1
execute in hook:world run setblock 1091 71 5 minecraft:sea_lantern
function hook:stage/3/bell/rang {name:"南の風の鐘"}
