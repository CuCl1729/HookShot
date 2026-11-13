#> hook:stage/5/dawn
# 夜明け: 妖精の村の天井(葉)がほどけて空が開き、光が降りる。時刻は動かさない(core/reset → intro/build で天井は戻る)
execute in hook:world run fill -92 74 -7 -68 74 7 minecraft:air
execute in hook:world run particle minecraft:end_rod -80 78 0 12 3 7 0.05 400 force @a
execute in hook:world run particle minecraft:firework -80 75 0 12 1 7 0 200 force @a
execute in hook:world run particle minecraft:totem_of_undying -80 68 0 10 4 6 0.5 150 force @a
execute in hook:world run playsound minecraft:block.beacon.activate master @a -80 70 0 4 1.2
execute in hook:world run playsound minecraft:entity.player.levelup master @a -80 70 0 4 0.7
execute in hook:world run playsound minecraft:ui.toast.challenge_complete master @a -80 70 0 4 0.8
title @a[scores={hook.stage=5}] times 20 70 30
title @a[scores={hook.stage=5}] subtitle {text:"太陽石が妖精の村の祭壇に戻り、世界に光が戻った",color:"yellow"}
title @a[scores={hook.stage=5}] title {text:"夜が明ける",color:"gold",bold:true}
