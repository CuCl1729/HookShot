#> hook:hook/start_pull
# @s = プレイヤー。実行位置 = 当たった点。tag=hook.anchor の方へ引っ張り始める。hook.pull = 撃ってからの tick、hook.spd = いまの引きの速さ
# 引き寄せ中の撃ち直し(#repull > 0。hook:hook/fire)は溜めを飛ばしてその速さから
tag @s add hook.pulling
scoreboard players set @s hook.pull 0
scoreboard players set @s hook.spd 0
execute if score #repull hook.temporary matches 1.. run scoreboard players operation @s hook.pull = #windup hook.cfg
execute if score #repull hook.temporary matches 1.. run scoreboard players operation @s hook.spd = #repull hook.temporary
scoreboard players set @s hook.stuck 0
scoreboard players set @s hook.hop 0
# 先端(引き終わり・中断で hook:hook/release が消す。重い敵へは pull_tick が追わせる)
kill @e[type=item_display,tag=hook.tip]
summon item_display ~ ~ ~ {Tags:["hook.tip"],billboard:"center",brightness:{sky:15,block:15},item:{id:"minecraft:tripwire_hook",count:1},transformation:{translation:[0.0f,0.0f,0.0f],scale:[0.6f,0.6f,0.6f],left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f]}}