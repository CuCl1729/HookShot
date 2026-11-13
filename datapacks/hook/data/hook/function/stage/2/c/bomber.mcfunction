#> hook:stage/2/c/bomber
# hook:world で実行。組立場に爆弾兵を1体補充する(この波の敵に数える)
scoreboard players set #cb hook.s2 0
execute positioned 676.5 64 35.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s2
tag @e[tag=hook.new] add hook.s2c
particle minecraft:large_smoke 676.5 66 35.5 0.5 1 0.5 0 20 force @a
playsound minecraft:block.piston.extend block @a[scores={hook.stage=2}] 676 66 35 2 0.8
tellraw @a[scores={hook.stage=2}] {text:"搬入口から爆弾兵が出てきた。掴んで群れへ投げろ。",color:"gray",italic:true}
