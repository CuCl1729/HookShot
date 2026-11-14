#> hook:enemy/gimmick
# @s = トゲに触れた敵(実行位置も @s)。プレスは mv に関係なく潰すので gimmick/press/step が enemy/kill を直接呼ぶ。
# 雑魚はフックで動かされた直後(hook.mv > 0。引き寄せ・掴み・投げ・弾き・突き飛ばし・スタンから #mv_t tick)だけ死ぬ(勝手に踏んで自滅しない)。
# ボスは常に hook:boss/hit へ(ボス側の判定に任せる)。奈落(y<32)は enemy/tick が常に hook:enemy/kill
execute if entity @s[tag=hook.boss] run return run function hook:boss/hit
execute if score @s hook.mv matches 1.. run function hook:enemy/kill
