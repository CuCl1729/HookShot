#> hook:player/died
# @s = 死んで復帰したばかりのプレイヤー(core の tick。immediate_respawn なのでもう生きている)
# 数える(#deaths 通算・#sdeaths ステージ内。hook.score)→ ナイトメアはステージの最初の cp へ → チェックポイントへ → 暗転・音・粒・ルミの一言
scoreboard players add #deaths hook.score 1
scoreboard players add #sdeaths hook.score 1
execute if score #level hook.diff matches 2 if score @s hook.stage matches 1..4 if data storage hook: cp0 run function hook:player/nightmare
function hook:cp/return
# 暗転は短く(blindness 1.5 秒。動きは止めない)
effect give @s minecraft:blindness 2 0 true
effect give @s minecraft:resistance 3 4 true
title @s times 5 35 15
title @s subtitle {text:"妖精の光が、きみを呼び戻す",color:"gold"}
title @s title {text:"倒れた……",color:"dark_red"}
execute at @s run playsound minecraft:block.respawn_anchor.deplete master @s ~ ~ ~ 1 0.8
execute at @s run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 0.8 1.4
# 目(1.62)の近くに出すと画面を覆う大きな四角になるので、足元の周りに出す
execute at @s run particle minecraft:end_rod ~ ~0.3 ~ 0.9 0.2 0.9 0.04 40 force @s
execute at @s run particle minecraft:soul_fire_flame ~ ~0.2 ~ 0.6 0.1 0.6 0.02 30 force @s
scoreboard players operation #m hook.temporary = #deaths hook.score
scoreboard players operation #m hook.temporary %= #3 hook.constant
execute if score #level hook.diff matches 2 if score @s hook.stage matches 1..4 run return run function hook:fairy/say {text:"ナイトメアだから、ステージの最初からだよ。……負けないで！"}
execute if score #m hook.temporary matches 0 run function hook:fairy/say {text:"だいじょうぶ？ もう一回いこう！"}
execute if score #m hook.temporary matches 1 run function hook:fairy/say {text:"痛かったね……でも、まだ終われないよ"}
execute if score #m hook.temporary matches 2 run function hook:fairy/say {text:"落ち着いて。仕掛けをよく見てみよう"}
