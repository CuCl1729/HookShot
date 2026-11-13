#> hook:stage/0/start
# @s = プレイヤー(導入の扉 hook:intro/finish から)。訓練場の最初へ。地形・扉・敵を建て直す(build は core の tick が built.s0 の無い間呼ぶ)
scoreboard players set @s hook.stage 0
scoreboard players set @s hook.tut 1
scoreboard players set @s hook.ask 0
scoreboard players set #fl hook.tut 0
scoreboard players set #t hook.tut 0
tag @s remove hook.grabbed_heavy
# hook.t0g = 最初の目的(鈴)を出した / hook.t0bell = 鈴を鳴らした(stage/0/player)
tag @s remove hook.t0g
tag @s remove hook.t0bell
kill @e[tag=hook.tut]
data remove storage hook: built.s0
execute in hook:world run forceload add -32 -16 95 47
execute in hook:world run tp @e[tag=hook.npc] -24.5 64 2.5 -90 0
function hook:cp/set {id:0,x:-28.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
function hook:fx/stage_title {name:"訓練場",sub:"妖精の村のはずれ"}
tellraw @s {text:"§e長老§f「鉤は武器ではない。じゃが、使いようじゃ。動きながら覚えよ」"}
