#> hook:boss/2/hit
# @s = 何かが当たった番人(実行位置も)。hook:boss/hit から(プレス・投げた敵・爆発。毎 tick 来うる)
# 傷になるのは動作中のプレス(潰す tick 3〜8)の下にいるときだけ。それ以外は 5 秒動けなくなるだけ(その間にプレスへ押し込む)
execute unless score #state hook.b2 matches 1 run return 0
execute if score #inv hook.b2 matches 1.. run return 0
execute unless entity @e[type=marker,tag=hook.press,scores={hook.press=3..8},distance=..8] run return run function hook:boss/2/daze
scoreboard players remove #hp hook.b2 1
scoreboard players set #inv hook.b2 60
function hook:core/call {f:"hook:boss/2/bar_set"}
# 被弾: 火花・溶岩・轟音(粒子と音だけ)
particle minecraft:explosion_emitter ~ ~1.5 ~ 0 0 0 0 1 force @a
particle minecraft:electric_spark ~ ~2 ~ 1 1.5 1 0.4 100 force @a
particle minecraft:lava ~ ~2 ~ 1 1 1 0 25 force @a
particle minecraft:large_smoke ~ ~2 ~ 1 1.5 1 0.05 50 force @a
playsound minecraft:entity.iron_golem.damage hostile @a ~ ~ ~ 3 0.5
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.7
playsound minecraft:block.anvil.destroy hostile @a ~ ~ ~ 2 0.6
execute if score #hp hook.b2 matches ..0 run return run function hook:boss/2/defeat
effect give @s minecraft:glowing 3 0 true
function hook:boss/2/set {a:4}
# 段階: 予告と間が短くなる。HP2 から部品を呼び、HP1 は突進が二連続
execute if score #hp hook.b2 matches 3.. run function hook:fairy/say {text:"効いてる！ その調子だよ"}
execute if score #hp hook.b2 matches 2 run scoreboard players set #tel hook.b2 25
execute if score #hp hook.b2 matches 2 run scoreboard players set #ltel hook.b2 35
execute if score #hp hook.b2 matches 2 run scoreboard players set #idle hook.b2 40
execute if score #hp hook.b2 matches 2 run tellraw @a[scores={hook.stage=2}] {text:"番人の歯車が軋む…部品を呼び始めた。",color:"gray",italic:true}
execute if score #hp hook.b2 matches 2 run function hook:fairy/say {text:"部品を呼んでる！ 番人に投げつければ止まるよ"}
execute if score #hp hook.b2 matches 1 run scoreboard players set #tel hook.b2 20
execute if score #hp hook.b2 matches 1 run scoreboard players set #ltel hook.b2 30
execute if score #hp hook.b2 matches 1 run scoreboard players set #idle hook.b2 25
execute if score #hp hook.b2 matches 1 run tellraw @a[scores={hook.stage=2}] {text:"番人が暴走している! 突進が二度続く。",color:"red",italic:true}
execute if score #hp hook.b2 matches 1 run function hook:fairy/say {text:"暴走してる！ 突進が二回くるよ、あと一押し！"}
execute if score #hp hook.b2 matches 1..2 run function hook:boss/2/pace
# 段階の変わり目: 赤い蒸気と咆哮
execute if score #hp hook.b2 matches 1..2 run particle minecraft:flame ~ ~3 ~ 1 1 1 0.15 80 force @a
execute if score #hp hook.b2 matches 1..2 run particle minecraft:large_smoke ~ ~4 ~ 1.5 1 1.5 0.1 80 force @a
execute if score #hp hook.b2 matches 1..2 run playsound minecraft:entity.ravager.roar hostile @a ~ ~ ~ 3 0.5
