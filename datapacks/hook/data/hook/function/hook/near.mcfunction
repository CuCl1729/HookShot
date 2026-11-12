#> hook:hook/near
# @s = 引かれているプレイヤー。@macro d = 終了距離。錨がその内にあれば tag hook.arrive
$execute if entity @n[tag=hook.anchor,distance=..$(d)] run tag @s add hook.arrive
