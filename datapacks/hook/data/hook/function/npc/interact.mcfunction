#> hook:npc/interact
# @s = 師範の3マス以内に入ったプレイヤー(hook:stage/0/tick から)。今の段階のヒントを話す
execute if score @s hook.tut matches 1 run tellraw @s [{text:"[師範] ",color:"yellow"},{text:"フックショットを持って、向こう岸の柱を見ながら右クリックだ。刺さった所へお前が引っ張られる。",color:"white"}]
execute if score @s hook.tut matches 2 run tellraw @s [{text:"[師範] ",color:"yellow"},{text:"台の上のゾンビにフックを当てろ。軽い敵はこちらへ飛んでくる。トゲを挟んで撃て。",color:"white"}]
execute if score @s hook.tut matches 3 run tellraw @s [{text:"[師範] ",color:"yellow"},{text:"浮島の重装兵を狙え。重い敵には、お前の方が飛んでいく。",color:"white"}]
execute unless score @s hook.tut matches 1..3 run tellraw @s [{text:"[師範] ",color:"yellow"},{text:"訓練は終わった。行け。",color:"white"}]
