#> hook:combat/yank_start
# @s = フックが当たった軽い敵。プレイヤー(tag hook.owner)の目の前へ引き寄せ始める(毎 tick hook:combat/yank_tick)
tag @s add hook.yanking
scoreboard players set @s hook.spd 0
scoreboard players operation @s hook.mv = #mv_t hook.cfg
# 爆弾兵は掴まれている間は自爆しない(Fuse を延ばす。放すと戻す)
execute if entity @s[tag=hook.bomb] run data modify entity @s Fuse set value 32767s
