#> hook:stage/3/wave/open
# in hook:world。番兵を全部落とした → 門の鉄格子を外す
fill 1292 99 -2 1292 103 2 minecraft:air replace minecraft:iron_bars
particle minecraft:end_rod 1292 101 0 0.3 2 2 0.02 60 force @a
particle minecraft:firework 1292 101 0 1 3 3 0.1 100 force @a
particle minecraft:totem_of_undying 1292 101 0 1 2 2 0.4 60 force @a
playsound minecraft:block.iron_door.open block @a 1292 101 0 3 0.7
playsound minecraft:block.beacon.activate block @a 1292 101 0 3 0.8
playsound minecraft:entity.firework_rocket.large_blast block @a 1292 101 0 3 1
tellraw @a[scores={hook.stage=3}] {text:"門が開いた。くぐろう。",color:"gray"}
function hook:guide/set {text:"門をくぐって玉座へ",x:1294.5,y:99,z:0.5}
function hook:fairy/say {text:"門が開いた！ この先に虚の王がいるよ。……行こう"}
