#> hook:diff/apply
# #level hook.diff から各値を決める(load・diff/set・core/reset から)。ステージ・ボスは hook.diff の偽プレイヤーを読む:
#   #tele_pct 予告時間の倍率(%) / #boss_hp_add ボスHPの加算 / #spd 雑魚の移動速度の加算(%) / #fuel_pct フロート燃料(%) / #hp 最大体力
# フロート燃料は hook/config の #fuel hook.cfg を書き換える(元の値は load が #fuel_base に控える)
execute unless score #level hook.diff matches 1..2 run function hook:diff/v {tele:100,hp_add:0,spd:0,fuel:100,hp:20,s:"0",name:"ノーマル",c:"green"}
execute if score #level hook.diff matches 1 run function hook:diff/v {tele:80,hp_add:1,spd:20,fuel:75,hp:12,s:"0.2",name:"ハード",c:"gold"}
execute if score #level hook.diff matches 2 run function hook:diff/v {tele:65,hp_add:2,spd:40,fuel:50,hp:6,s:"0.4",name:"ナイトメア",c:"dark_red"}
scoreboard players operation #fuel hook.cfg = #fuel_base hook.diff
scoreboard players operation #fuel hook.cfg *= #fuel_pct hook.diff
scoreboard players operation #fuel hook.cfg /= #100 hook.constant
execute as @a run function hook:diff/player
function hook:guide/refresh
