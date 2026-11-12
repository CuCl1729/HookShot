#> hook:stage/3/bridge
# 三つの鐘が鳴った → 広場の東から門の島へ虹の橋(環 B1〜B5 と中の島 MI)
execute in hook:world run function hook:stage/3/bridge_blocks
execute in hook:world run particle minecraft:end_rod 1180 92 0 60 8 2 0.02 300 force @a
execute as @a[scores={hook.stage=3}] at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1
title @a[scores={hook.stage=3}] times 10 60 20
title @a[scores={hook.stage=3}] title {text:"虹の橋",color:"aqua"}
title @a[scores={hook.stage=3}] subtitle {text:"三つの鐘が、門への道を架けた",color:"gray"}
tellraw @a[scores={hook.stage=3}] {text:"虹の橋が架かった。広場の東から環を辿り、門の島へ。",color:"gray"}
