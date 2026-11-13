#> hook:dev/out/heavies
# 試験用(schedule から)。重い敵の位置と速度を出す
execute as @e[tag=hook.heavy,tag=!hook.boss] run tellraw @a ["MCO heavy ",{nbt:"Pos",entity:"@s"}," ",{nbt:"Motion",entity:"@s"}]
