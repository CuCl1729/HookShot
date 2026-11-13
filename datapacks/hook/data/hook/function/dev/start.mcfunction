#> hook:dev/start
# @s = プレイヤー。計測用の試験場(x 1800〜1880, z ±12, 床 y 63)へ。進行を 99 にしてステージの tick を止める。
# 読み込み後に hook:dev/build を呼ぶ。戻すときは hook:core/reset
execute in hook:world run forceload add 1792 -16 1887 15
scoreboard players set @s hook.stage 99
function hook:cp/set {id:99,x:1806.5,y:64,z:0.5,yaw:-90}
function hook:cp/return
function hook:player/give_hook
function hook:player/give_bell
