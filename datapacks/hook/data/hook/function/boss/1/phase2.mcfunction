#> hook:boss/1/phase2
# HP 3 以下: 速くなり、踏みつけが加わる。砕けたトゲの島が生え直す
scoreboard players set #ph hook.b1 2
function hook:boss/1/spikes
# 足元の島は生やさない(無敵が切れた瞬間に、よろけたまま踏んで只で傷を負う)
fill ~-2 ~-1 ~-2 ~2 ~1 ~2 minecraft:air replace minecraft:amethyst_cluster
playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 2 0.4
title @a[scores={hook.stage=1}] times 5 40 10
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle {text:"巨兵の水晶が赤く光る。トゲが生え直した",color:"red"}
