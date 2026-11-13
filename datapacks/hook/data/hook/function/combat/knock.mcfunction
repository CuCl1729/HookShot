#> hook:combat/knock
# @s = 弾かれる敵。実行の向きへ #kv hook.temporary(×100)で弾き、怯ませる(hook:hook/stun。60 tick、tag hook.stun)。
# 投げ・叩きつけ・突き飛ばしでは敵は死なない。弾かれた敵は hook.mv が立つので、その先のトゲ・プレス・奈落で死ぬ
particle minecraft:crit ~ ~1 ~ 0.4 0.4 0.4 0.3 12 force @a
playsound minecraft:block.anvil.land hostile @a ~ ~ ~ 0.6 1.6
function hook:hook/stun
function hook:combat/fling
