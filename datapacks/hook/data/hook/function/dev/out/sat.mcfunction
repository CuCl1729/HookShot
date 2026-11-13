#> hook:dev/out/sat
# プレイヤーに満腹度回復が付いているかをチャットへ(mcrun が拾う。schedule からも呼べるよう @a を見る)
execute as @a if predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:effects":{"minecraft:saturation":{}}}} run tellraw @a ["MCO sat yes t=",{score:{name:"#tick",objective:"hook.temporary"}}]
execute as @a unless predicate {type:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:effects":{"minecraft:saturation":{}}}} run tellraw @a ["MCO sat no t=",{score:{name:"#tick",objective:"hook.temporary"}}]
