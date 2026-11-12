#> hook:boss/3/warp_alt
# @s = 行き先の目印(王が今いる島を選んでしまった)。玉座の島 C にいれば T へ、それ以外は C へ
execute if entity @e[tag=hook.boss3,x=1545,y=60,z=-5,dx=10,dy=10,dz=10] run return run tp @s 1581.5 64 0.5
tp @s 1550.5 64 0.5
