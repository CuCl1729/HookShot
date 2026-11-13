#> hook:intro/chosen
# 難易度を選んだ(選び直しも)。札を光らせ、扉を開け、目的を「扉へ」にする
function hook:intro/labels
execute in hook:world run fill -67 63 -1 -67 65 1 minecraft:air replace minecraft:iron_bars
execute in hook:world run particle minecraft:end_rod -66.5 64.5 0.5 0.3 1 1 0.02 30 force @a
execute in hook:world run playsound minecraft:block.iron_door.open master @a -67 64 0 1 0.8
function hook:guide/set {text:"扉をくぐって訓練場へ",x:-64.5,y:63,z:0.5}
