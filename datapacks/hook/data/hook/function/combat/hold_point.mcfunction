#> hook:combat/hold_point
# @macro hold = 目からの距離。掴んだ敵の足を置く位置(目の前 hold、体の中心が視線に来るよう 1 下)に目印 hook.hp を出す
$execute at @a[tag=hook.owner,limit=1] anchored eyes positioned ^ ^ ^$(hold) positioned ~ ~-1 ~ run summon marker ~ ~ ~ {Tags:["hook.hp"]}
