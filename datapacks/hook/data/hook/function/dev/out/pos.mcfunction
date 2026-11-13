#> hook:dev/out/pos
# @s の座標と向きをチャットへ(mcrun が拾う)
tellraw @a ["MCO pos ",{entity:"@s",nbt:"Pos"}," rot ",{entity:"@s",nbt:"Rotation"}]
