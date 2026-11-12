#> hook:combat/fling
# @s = 弾かれる敵。実行の向きへ #shock_v で飛ばす(#mv_t の間、叩きつけ・ギミックで死ねる)
function hook:util/dir
scoreboard players operation #dx hook.temporary *= #shock_v hook.cfg
scoreboard players operation #dy hook.temporary *= #shock_v hook.cfg
scoreboard players operation #dz hook.temporary *= #shock_v hook.cfg
execute store result entity @s Motion[0] double 0.00001 run scoreboard players get #dx hook.temporary
execute store result entity @s Motion[1] double 0.00001 run scoreboard players get #dy hook.temporary
execute store result entity @s Motion[2] double 0.00001 run scoreboard players get #dz hook.temporary
scoreboard players operation @s hook.mv = #mv_t hook.cfg
scoreboard players set @s hook.vh 0
