#> hook:stage/2/wall
# @s = 外壁(北・東。高さ 40、上端 y 104)の上のほうへ登ったプレイヤー。@macro x/z: 下ろす先(壁の内側の床。~ 可)
# 北の壁は炉の台 B3 の 3 マス隣なので、壁を撃って登るとクレーンを飛ばせてしまう(新しい跳ね + フロートで約 5〜8 上がる)
function hook:hook/release
$tp @s $(x) 64 $(z)
# 隅などで下ろした先が埋まっていればチェックポイントへ
execute at @s unless block ~ ~ ~ #hook:pass run function hook:cp/return
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.6
execute at @s run particle minecraft:end_rod ~ ~1 ~ 0.3 0.8 0.3 0.02 20 force @a
function hook:fairy/say {text:"外の壁は高すぎて登れないよ。柱とクレーンを伝っていこう"}
