#> hook:boss/3/stagger
# 王が怯む(手下が当たった・爆弾兵の爆発・第2形態で縛られた)。行動を止め、#stag tick の間トゲ・プレス・奈落が効く
# もう怯んでいれば延ばすだけ
execute if score #stag hook.b3 matches 1..119 run scoreboard players set #stag hook.b3 120
execute if score #stag hook.b3 matches 1.. run return 0
function hook:boss/3/rest
scoreboard players set #stag hook.b3 120
effect give @e[tag=hook.boss3] minecraft:glowing 6 0 true
execute at @e[tag=hook.boss3] run particle minecraft:electric_spark ~ ~3 ~ 0.8 0.8 0.8 0 40 force @a
execute at @e[tag=hook.boss3] run playsound minecraft:block.anvil.place hostile @a ~ ~ ~ 2 0.5
execute if score #state hook.b3 matches 1 run title @a[scores={hook.stage=4}] actionbar {text:"怯んだ! 今のうちに突っ込んでトゲかプレスへ突き飛ばせ",color:"yellow"}
execute if score #state hook.b3 matches 3 run title @a[scores={hook.stage=4}] actionbar {text:"縛った! 突き飛ばして奈落へ落とせ",color:"yellow"}
