#> hook:dev/aim_ent
# 試験用。@s = プレイヤー。@macro tag = 狙う実体の目印、dy = その足から上へずらす量。目の高さからそこへ向けて撃つ(動く的・台用)
$execute at @n[tag=$(tag)] run summon marker ~ ~$(dy) ~ {Tags:["hook.devm"]}
execute at @s anchored eyes facing entity @n[type=marker,tag=hook.devm] feet run rotate @s ~ ~
kill @e[type=marker,tag=hook.devm]
# 記録を始める(dev.q が残っていれば着いた瞬間に次を撃つ)
function hook:dev/rec_start
execute at @s run function hook:hook/fire
