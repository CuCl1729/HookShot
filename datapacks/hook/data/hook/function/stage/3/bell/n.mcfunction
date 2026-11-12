#> hook:stage/3/bell/n
# @s = 北の鐘の標的のスイッチ(重複しても1回だけ効く)
execute if score #n hook.s3 matches 1 run return 0
scoreboard players set #n hook.s3 1
execute in hook:world run setblock 1091 71 -5 minecraft:sea_lantern
function hook:stage/3/bell/rang {name:"北の風の鐘"}
