#> hook:fx/boss/burst
# 実行位置 = 空中の炸裂点。粒子と音の花火は必ず出す。本物の花火は 8 マス以内に誰もいないときだけ(炸裂は半径約 5 にダメージがある)
particle minecraft:firework ~ ~ ~ 2 2 2 0.15 200 force @a
particle minecraft:end_rod ~ ~ ~ 2.5 2.5 2.5 0.05 60 force @a
playsound minecraft:entity.firework_rocket.large_blast master @a ~ ~ ~ 4 1
playsound minecraft:entity.firework_rocket.twinkle master @a ~ ~ ~ 4 1
execute unless entity @a[distance=..8] run summon firework_rocket ~ ~-1 ~ {LifeTime:1,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;16766720],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
