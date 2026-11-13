#> hook:guide/beam_at
# @macro x/y/z = 目的地
$execute anchored eyes positioned ^ ^-0.3 ^ facing $(x) $(y) $(z) run function hook:guide/beam_draw
$particle minecraft:end_rod $(x) $(y) $(z) 0.15 1.5 0.15 0.01 6 force @s
