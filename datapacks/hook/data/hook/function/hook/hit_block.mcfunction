#> hook:hook/hit_block
# @s = プレイヤー。実行位置 = 当たったブロックの中の点(向きは視線)。当てた時点でフロートの燃料を満タンに(標的も)
scoreboard players operation @s hook.fuel = #fuel hook.cfg
execute if block ~ ~ ~ minecraft:target run return run function hook:hook/switch
particle minecraft:electric_spark ~ ~ ~ 0.2 0.2 0.2 0 10 force @a
playsound minecraft:block.chain.place block @a ~ ~ ~ 1 1
# 引っ張る先 = 当たった点の少し手前(ブロックにめり込まない所)
execute positioned ^ ^ ^-0.4 run summon marker ~ ~ ~ {Tags:["hook.anchor"]}
function hook:hook/start_pull
