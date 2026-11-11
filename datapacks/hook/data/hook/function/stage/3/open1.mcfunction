#> hook:stage/3/open1
# @s = プレイヤー。稽古のゾンビをスタンさせた → 光の足場 I1 を出す
# I1
execute in hook:world run fill 1018 63 -3 1025 63 3 minecraft:smooth_quartz
execute in hook:world run fill 1019 62 -2 1024 62 2 minecraft:calcite
execute in hook:world run fill 1021 64 0 1021 67 0 minecraft:quartz_pillar
execute in hook:world run fill 1021 68 0 1021 68 0 minecraft:sea_lantern
execute in hook:world run particle minecraft:electric_spark 1021.5 65 0.5 3 1 3 0 60 force @a
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"見たか。フックを当てた敵は火花を散らし、3秒は動けん。それがスタンチェインだ。",color:"white"}]
tellraw @s [{text:"[師範の声] ",color:"yellow"},{text:"痺れが解ければまた来る。足場が現れた。渡ったら島の端に立ち、谷を挟んで引け。引いた敵はお前の手前、谷へ落ちる。",color:"white"}]
