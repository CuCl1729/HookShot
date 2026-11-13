#> hook:stage/2/wall
# @s = 外壁(北・東。高さ 40、上端 y 104)の上のほうへ登ったプレイヤー。@macro x/z: 下ろす先(壁の内側の床。~ 可)
# 北の壁は炉の台 B3 の 3 マス隣なので、壁を撃って登るとクレーンを飛ばせてしまう(新しい跳ね + フロートで約 5〜8 上がる)
# 一言は登ろうとしたとき(足より上の錨へ引かれている・跳ねの途中・フロート中)だけ。高所から壁を撃って降りた・落ちたときは黙る
scoreboard players set #up hook.temporary 0
execute if entity @s[tag=hook.pulling] store result score #ay hook.temporary run data get entity @n[tag=hook.anchor] Pos[1]
execute if entity @s[tag=hook.pulling] store result score #py hook.temporary run data get entity @s Pos[1]
execute if entity @s[tag=hook.pulling] if score #ay hook.temporary >= #py hook.temporary run scoreboard players set #up hook.temporary 1
execute if entity @s[tag=!hook.pulling] if score @s hook.hop matches 1.. run scoreboard players set #up hook.temporary 1
execute if entity @s[tag=hook.floating] run scoreboard players set #up hook.temporary 1
function hook:hook/release
$tp @s $(x) 64 $(z)
# 隅などで下ろした先が埋まっていればチェックポイントへ
execute at @s unless block ~ ~ ~ #hook:pass run function hook:cp/return
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.6
execute at @s run particle minecraft:end_rod ~ ~1 ~ 0.3 0.8 0.3 0.02 20 force @a
execute if score #up hook.temporary matches 1 run function hook:fairy/say {text:"外の壁は高すぎて登れないよ。柱とクレーンを伝っていこう"}
