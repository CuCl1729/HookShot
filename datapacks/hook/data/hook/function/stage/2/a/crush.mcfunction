#> hook:stage/2/a/crush
# @s = 台車を潰した A のプレス marker。3基それぞれで1回ずつ潰すと炉 A が止まる
particle minecraft:lava ~2.5 ~1 ~2.5 1 0.5 1 0 20 force @a
execute if entity @s[tag=hook.s2done] run return run tellraw @a[scores={hook.stage=2}] {text:"このプレスではもう潰した。別のプレスで潰せ。",color:"gray",italic:true}
tag @s add hook.s2done
scoreboard players add #an hook.s2 1
playsound minecraft:block.anvil.destroy block @a ~2.5 ~ ~2.5 2 0.8
tellraw @a[scores={hook.stage=2}] [{text:"炉心の封印が割れた ",color:"gold"},{score:{name:"#an",objective:"hook.s2"},color:"yellow"},{text:"/3",color:"gray"}]
execute if score #an hook.s2 matches 3.. run function hook:stage/2/a/off
