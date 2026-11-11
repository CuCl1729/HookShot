#> hook:boss/1/defeat
# @s = HP が尽きた水晶の巨兵。後始末はここで終える(ステージ2へ移ると stage/1/tick は呼ばれない)
particle minecraft:explosion ~ ~2 ~ 1 1.5 1 0 12 force @a
playsound minecraft:entity.generic.explode hostile @a ~ ~ ~ 2 0.8
function hook:core/call {f:"hook:boss/1/bar_hide"}
kill @s
execute as @a[scores={hook.stage=1}] run function hook:boss/1/reward
