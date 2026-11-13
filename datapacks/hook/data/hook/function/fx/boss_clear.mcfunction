#> hook:fx/boss_clear
# 実行位置 = 倒したボスの所(hook:world)。約 4 秒の撃破演出: 閃光と轟音 → 光の輪 → 花火 3 連 → 余韻の和音
# 位置は marker(tag hook.fxb)に残し、続きは schedule(実行者・位置を持たない)から marker として動かす
# 余韻: tick rate は関数の権限(GAMEMASTER)では使えない(TickCommand は LEVEL_ADMINS)。代わりに全員に短い鈍足+低速落下でスロー感を出す
# プレイヤーにダメージ・押し出しは無い(本物の花火は人のいない上空でだけ炸裂させる)
kill @e[type=marker,tag=hook.fxb]
summon marker ~ ~ ~ {Tags:["hook.fxb"]}
title @a times 3 50 20
title @a subtitle {text:"",color:"white"}
title @a title {text:"撃破！",color:"gold",bold:true}
particle minecraft:explosion_emitter ~ ~1.5 ~ 0 0 0 0 1 force @a
particle minecraft:end_rod ~ ~1.5 ~ 0.3 0.3 0.3 0.5 120 force @a
particle minecraft:flame ~ ~1 ~ 0.5 0.8 0.5 0.3 80 force @a
playsound minecraft:entity.generic.explode master @a ~ ~ ~ 3 0.5
playsound minecraft:entity.wither.break_block master @a ~ ~ ~ 2 0.6
playsound minecraft:block.beacon.deactivate master @a ~ ~ ~ 3 0.5
effect give @a minecraft:slowness 2 3 true
effect give @a minecraft:slow_falling 2 0 true
effect give @a minecraft:resistance 5 4 true
schedule function hook:fx/boss/s1 10t
schedule function hook:fx/boss/s2 22t
schedule function hook:fx/boss/s3 34t
schedule function hook:fx/boss/s4 46t
schedule function hook:fx/boss/s5 70t
