#> hook:stage/5/dawn
# 夜明けの演出(玉座の島の上空に光が広がる)。dimension の時刻は動かさず、パーティクル・音・title・効果で表す
execute in hook:world run particle minecraft:end_rod 1550 80 0 20 10 20 0.05 400 force @a
execute in hook:world run particle minecraft:totem_of_undying 1550 70 0 10 5 10 0.5 150 force @a
execute in hook:world run playsound minecraft:block.beacon.activate master @a 1550 64 0 4 0.8
execute in hook:world run playsound minecraft:entity.firework_rocket.large_blast ambient @a 1550 70 0 4 0.8
effect give @a[scores={hook.stage=5}] minecraft:night_vision 40 0 true
title @a[scores={hook.stage=5}] times 10 70 30
title @a[scores={hook.stage=5}] title {text:"夜が明ける",color:"gold",bold:true}
title @a[scores={hook.stage=5}] subtitle {text:"太陽石が、村の灯台へ戻った",color:"yellow"}
