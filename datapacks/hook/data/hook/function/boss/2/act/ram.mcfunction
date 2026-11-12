#> hook:boss/2/act/ram
# @s = 突進中の番人。近くのプレイヤーに当たった(1回の突進で1度だけ)
scoreboard players set #hitp hook.b2 1
function hook:core/call {f:"hook:boss/2/hurt"}
playsound minecraft:entity.iron_golem.attack hostile @a ~ ~ ~ 2 0.7
