#> hook:stage/3/bell/t
# @s = 塔の鐘の標的のスイッチ
execute if score #t hook.s3 matches 1 run return 0
scoreboard players set #t hook.s3 1
execute in hook:world run setblock 1091 71 0 minecraft:sea_lantern
function hook:stage/3/bell/rang {name:"塔の風の鐘"}
