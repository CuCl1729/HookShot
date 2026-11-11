#> hook:stage/5/rockets
# hook:core/call 経由(花火エンティティの NBT は実例が無い。フィールド名は 26.3.jar の FireworkRocketEntity / Fireworks / FireworkExplosion で確認)
# プレイヤー(玉座の島 y 64)から 15 以上上で炸裂させる(花火の爆発は近くの生き物を傷つけるため)
execute in hook:world run summon firework_rocket 1542 80 -8 {LifeTime:15,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"large_ball",colors:[I;16766720],fade_colors:[I;16777215],has_trail:true,has_twinkle:true}]}}}}
execute in hook:world run summon firework_rocket 1558 80 8 {LifeTime:15,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"star",colors:[I;5636095],fade_colors:[I;16733695],has_twinkle:true}]}}}}
execute in hook:world run summon firework_rocket 1558 80 -8 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"burst",colors:[I;16733695],has_trail:true}]}}}}
execute in hook:world run summon firework_rocket 1542 80 8 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{flight_duration:1,explosions:[{shape:"small_ball",colors:[I;16777215,16766720]}]}}}}
