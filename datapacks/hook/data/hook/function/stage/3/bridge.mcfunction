#> hook:stage/3/bridge
# 三つの鐘が鳴った → 広場の東から門の島へ虹の橋(環 B1〜B5 と中の島 MI)
execute in hook:world run function hook:stage/3/bridge_blocks
execute in hook:world run particle minecraft:end_rod 1180 92 0 60 8 2 0.02 300 force @a
execute in hook:world run particle minecraft:firework 1116 78 0 2 3 2 0.1 60 force @a
execute in hook:world run particle minecraft:firework 1160 86 0 5 3 5 0.1 80 force @a
execute in hook:world run particle minecraft:firework 1222 102 0 2 3 2 0.1 60 force @a
execute in hook:world run particle minecraft:totem_of_undying 1248 102 0 3 3 3 0.3 80 force @a
execute as @a[scores={hook.stage=3}] at @s run playsound minecraft:block.beacon.activate master @s ~ ~ ~ 1 1
execute as @a[scores={hook.stage=3}] at @s run playsound minecraft:entity.firework_rocket.large_blast master @s ~ ~ ~ 1 1
execute as @a[scores={hook.stage=3}] at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 0.8 1
title @a[scores={hook.stage=3}] times 10 60 20
title @a[scores={hook.stage=3}] title {text:"虹の橋",color:"aqua"}
title @a[scores={hook.stage=3}] subtitle {text:"三つの鐘が、門への道を架けた",color:"gray"}
tellraw @a[scores={hook.stage=3}] {text:"虹の橋が架かった。広場の東から環を辿り、門の島へ。",color:"gray"}
function hook:guide/set {text:"虹の橋を渡る",x:1116.5,y:76,z:0.5}
function hook:fairy/say {text:"三つ揃った！ 虹の橋が架かったよ。広場の東から、環をひとつずつ渡っていこう"}
