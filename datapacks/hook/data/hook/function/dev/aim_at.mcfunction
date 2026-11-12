#> hook:dev/aim_at
# @s = プレイヤー。@macro tag = 狙う敵の目印。その敵の足へ向けて撃つ(目の高さの線が体の中ほどを通る)
$tp @s ~ ~ ~ facing entity @n[tag=$(tag)] feet
execute at @s run function hook:hook/fire
