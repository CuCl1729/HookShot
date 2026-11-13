#> hook:dev/out/ents
# 試験場の敵(tag dev.*)の位置・体力・タグをチャットへ。schedule からも呼べる(実行者なし)
execute as @e[tag=hook.enemy] if entity @s[tag=!hook.boss] run tellraw @a ["MCO ent ",{entity:"@s",nbt:"Pos"}," hp ",{entity:"@s",nbt:"Health"}," stun ",{score:{name:"@s",objective:"hook.stun"}}," tags ",{entity:"@s",nbt:"Tags"}]
execute store result score #n hook.temporary if entity @e[tag=hook.enemy]
tellraw @a ["MCO enemies ",{score:{name:"#n",objective:"hook.temporary"}}," kills ",{score:{name:"#kills",objective:"hook.score"}}]
