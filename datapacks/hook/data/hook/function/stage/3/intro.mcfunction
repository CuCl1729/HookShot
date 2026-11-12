#> hook:stage/3/intro
# 虚の王への導入
execute as @a[scores={hook.stage=3}] at @s run playsound minecraft:block.end_portal.spawn master @s ~ ~ ~ 0.6 0.6
execute as @a[scores={hook.stage=3}] at @s run particle minecraft:reverse_portal ~ ~1 ~ 3 2 3 0.05 200 force @s
title @a[scores={hook.stage=3}] times 20 60 20
title @a[scores={hook.stage=3}] title {text:"虚の王",color:"dark_purple",bold:true}
title @a[scores={hook.stage=3}] subtitle {text:"橋の先に、玉座が見える",color:"gray"}
tellraw @a[scores={hook.stage=3}] {text:"門の向こうから、何も無いはずの場所が見返してくる。",color:"gray",italic:true}
tellraw @a[scores={hook.stage=3}] {text:"ヒント: 虚の王は、トゲ、プレス、奈落のすべてで来る。",color:"gray"}
