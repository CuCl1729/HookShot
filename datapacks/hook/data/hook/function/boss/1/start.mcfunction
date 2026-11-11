#> hook:boss/1/start
# @s = 闘技場の奥へ入ったプレイヤー。水晶の巨兵を出す。HP は #b1.hp、無敵時間は #b1.inv(hook.temporary)
function hook:boss/1/reset
execute in hook:world positioned 483.5 64 7.5 run summon zombie ~ ~ ~ {Tags:["hook.enemy","hook.heavy","hook.boss","hook.boss1","hook.s1"],PersistenceRequired:1b,Invulnerable:1b,CustomName:{text:"水晶の巨兵",color:"light_purple"},equipment:{head:{id:"minecraft:amethyst_block",count:1},chest:{id:"minecraft:diamond_chestplate",count:1},legs:{id:"minecraft:diamond_leggings",count:1},feet:{id:"minecraft:diamond_boots",count:1}},attributes:[{base:2.2,id:scale},{base:1,id:knockback_resistance},{base:0.17,id:movement_speed},{base:48,id:follow_range}]}
scoreboard players set #b1.hp hook.temporary 3
scoreboard players set #b1.inv hook.temporary 0
function hook:core/call {f:"hook:boss/1/bar_show"}
playsound minecraft:block.amethyst_block.resonate hostile @a ~ ~ ~ 2 0.5
title @s title {text:"水晶の巨兵",color:"light_purple"}
title @s subtitle {text:"巨兵を紫のトゲへ誘い込め",color:"gray"}
