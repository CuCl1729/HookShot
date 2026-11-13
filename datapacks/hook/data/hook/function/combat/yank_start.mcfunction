#> hook:combat/yank_start
# @s = フックが当たった軽い敵。プレイヤー(tag hook.owner)の目の前へ引き寄せ始める(毎 tick hook:combat/yank_tick)
tag @s add hook.yanking
scoreboard players set @s hook.spd 0
scoreboard players operation @s hook.mv = #mv_t hook.cfg
# 爆弾兵は掴まれている間は自爆しない(hook:enemy/fuse は引き寄せ・掴み・投げの間は数えない。放すと 0 から)
scoreboard players set @s hook.fuse 0
