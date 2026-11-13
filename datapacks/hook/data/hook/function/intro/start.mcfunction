#> hook:intro/start
# @s = 新しいプレイヤー(player/join から)。妖精の村の一角(x -93〜-61、訓練場の外)から始める。hook.stage -1
# 流れ(intro/tick、#t hook.intro): 語り → 長老が鉤を授ける → ルミ登場・鈴 → 長老「旅の重さを選ぶがよい」→ 標的を鉤で撃って難易度 → 扉 → stage/0/start
scoreboard players set @s hook.stage -1
scoreboard players set #t hook.intro 0
scoreboard players set #chosen hook.diff 0
data remove storage hook: built.intro
function hook:guide/clear
execute in hook:world run forceload add -96 -16 -49 15
function hook:cp/set {id:-1,x:-86.5,y:63,z:0.5,yaw:-90}
function hook:cp/return
effect give @s minecraft:blindness 4 0 true
