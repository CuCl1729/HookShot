#> hook:enemy/summon/heavy
# 重装兵: 鉄装備・scale 1.4・ノックバック無効。tag hook.heavy
summon zombie ~ ~ ~ {Tags:["hook.enemy","hook.heavy","hook.new"],PersistenceRequired:1b,CustomName:{text:"重装兵",color:"gray"},equipment:{mainhand:{id:"minecraft:iron_axe",count:1},head:{id:"minecraft:iron_helmet",count:1,components:{"minecraft:unbreakable":{}}},chest:{id:"minecraft:iron_chestplate",count:1},legs:{id:"minecraft:iron_leggings",count:1},feet:{id:"minecraft:iron_boots",count:1}},attributes:[{base:1.4,id:scale},{base:1,id:knockback_resistance}]}
