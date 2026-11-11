#> hook:hook/switch
# @s = プレイヤー。実行位置 = 撃たれた標的ブロックの中。
# スイッチの API: 標的ブロックの中心に marker {Tags:["hook.switch"],data:{f:"<関数>"}} を置いておくと、
# 撃たれたときにその関数を as marker / at ブロック中心 で呼ぶ(関数は読み込み時に無くてもよい)
particle minecraft:electric_spark ~ ~ ~ 0.3 0.3 0.3 0 15 force @a
playsound minecraft:block.note_block.bell block @a ~ ~ ~ 1 1.5
execute align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=marker,tag=hook.switch,distance=..0.5] run function hook:core/call with entity @s data
