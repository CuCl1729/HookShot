#> hook:stage/3/bell/guide
# 未達の鐘のうち 1 つを目的地にして案内を更新する(広場に着いたとき・鐘が鳴るたび)。優先は 北 > 塔 > 南
execute store result storage hook: s3g.n int 1 run scoreboard players get #bells hook.s3
execute unless score #s hook.s3 matches 1 run data modify storage hook: s3g merge value {x:1189.5,y:79,z:40.5}
execute unless score #t hook.s3 matches 1 run data modify storage hook: s3g merge value {x:1211.5,y:117,z:-33.5}
execute unless score #n hook.s3 matches 1 run data modify storage hook: s3g merge value {x:1019.5,y:109,z:-41.5}
function hook:stage/3/bell/guide_set with storage hook: s3g
