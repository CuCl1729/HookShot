#> hook:stage/0/back
# @s = 今の段階より先の区画へ壁を越えて入ったプレイヤー(stage/0/player)。チェックポイントへ戻す
function hook:cp/return
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 0.5
title @s actionbar {text:"順番に行こう。いまの目的は右のサイドバー",color:"aqua"}
