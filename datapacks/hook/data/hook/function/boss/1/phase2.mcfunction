#> hook:boss/1/phase2
# HP 3 以下: 速くなり、踏みつけが加わる。砕けたトゲの島が生え直す
scoreboard players set #ph hook.b1 2
function hook:boss/1/spikes
# 足元の島は生やさない(無敵が切れた瞬間に、よろけたまま踏んで只で傷を負う)
fill ~-2 ~-1 ~-2 ~2 ~1 ~2 minecraft:air replace minecraft:amethyst_cluster
playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 2 0.4
playsound minecraft:entity.ender_dragon.growl hostile @a ~ ~ ~ 2 0.8
particle minecraft:explosion_emitter ~ ~2 ~ 0 0 0 0 1 force @a
particle minecraft:flame ~ ~0.5 ~ 6 0.2 6 0.05 250 force @a
particle minecraft:lava ~ ~3 ~ 1 1 1 0 30 force @a
execute in hook:world run particle minecraft:end_rod 335.5 73 0.5 14 0.5 9 0.05 200 force @a
function hook:fairy/say {text:"トゲが生え直した！ もう一度誘いこもう"}
title @a[scores={hook.stage=1}] times 5 40 10
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle {text:"巨兵の水晶が赤く光る。トゲが生え直した",color:"red"}
