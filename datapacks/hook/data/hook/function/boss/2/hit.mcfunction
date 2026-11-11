#> hook:boss/2/hit
# @s = ギミック(プレス)に触れた番人(実行位置も)。hook:boss/hit から毎 tick 来うるので無敵時間中は何もしない
execute if score #inv hook.b2 matches 1.. run return 0
scoreboard players remove #hp hook.b2 1
scoreboard players set #inv hook.b2 60
function hook:core/call {f:"hook:boss/2/bar_set"}
particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0 5 force @a
playsound minecraft:entity.iron_golem.damage hostile @a ~ ~ ~ 2 0.5
execute if score #hp hook.b2 matches ..0 run return run function hook:boss/2/defeat
effect give @s minecraft:glowing 3 0 true
# 傷つくほど速くなる(zombie の基本 0.23)
execute if score #hp hook.b2 matches 2 run attribute @s minecraft:movement_speed base set 0.27
execute if score #hp hook.b2 matches 1 run attribute @s minecraft:movement_speed base set 0.31
tellraw @a[scores={hook.stage=2}] {text:"番人の歯車が軋んでいる…",color:"gray",italic:true}
