#> hook:stage/0/bell
# @s = 訓練場で初めてルミの鈴を鳴らしたプレイヤー。次は壁の上へ
tag @s add hook.t0bell
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
particle minecraft:end_rod ~ ~1.5 ~ 0.4 0.4 0.4 0.05 20 force @s
function hook:fairy/say {text:"そう、それ！ 光の筋の先が行き先だよ。迷ったらいつでも鳴らしてね"}
function hook:stage/0/goal
