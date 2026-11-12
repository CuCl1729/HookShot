#> hook:boss/3/ring_wave
# @macro r = 半径 / lo = r-1。王を中心に、帯に入った接地中のプレイヤーに傷、輪を 24 方向に描く
$execute at @n[tag=hook.boss3] as @a[scores={hook.stage=4},distance=$(lo)..$(r),nbt={OnGround:1b}] run function hook:core/call {f:"hook:boss/3/hurt"}
$execute at @n[tag=hook.boss3] rotated 0 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 15 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 30 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 45 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 60 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 75 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 90 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 105 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 120 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 135 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 150 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 165 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 180 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 195 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 210 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 225 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 240 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 255 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 270 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 285 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 300 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 315 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 330 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
$execute at @n[tag=hook.boss3] rotated 345 0 positioned ^ ^0.3 ^$(r) run particle minecraft:end_rod ~ ~ ~ 0.4 0.05 0.4 0 3 force @a
