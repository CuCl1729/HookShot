#> hook:stage/2/c/reset
# hook:world で実行。戦闘中にアリーナから誰もいなくなった: 敵を消して入口を開け、最初の波から
kill @e[tag=hook.s2c]
scoreboard players set #cw hook.s2 0
scoreboard players set #ct hook.s2 0
scoreboard players set #cb hook.s2 0
fill 674 64 14 678 68 14 minecraft:air
tellraw @a[scores={hook.stage=2}] {text:"組立場の機械が止まった。入り直すと最初の波からやり直しだ。",color:"gray",italic:true}
function hook:guide/set {text:"組立場に入り直して波に挑む",x:676.5,y:64,z:12.5}
