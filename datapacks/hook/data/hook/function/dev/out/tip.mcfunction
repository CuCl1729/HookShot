#> hook:dev/out/tip
# schedule 用。フックの先端(tag hook.tip)の数と位置をチャットへ
execute store result score #n hook.temporary if entity @e[type=item_display,tag=hook.tip]
tellraw @a ["MCO tips ",{score:{name:"#n",objective:"hook.temporary"}}," ",{entity:"@e[type=item_display,tag=hook.tip,limit=1]",nbt:"Pos"}]
