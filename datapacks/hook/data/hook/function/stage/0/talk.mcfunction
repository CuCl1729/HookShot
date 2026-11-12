#> hook:stage/0/talk
# @s = 師範のそばに来たプレイヤー(stage/0/tick・start から)。今の段階のこつ(操作の説明文。物語の文ではない)
execute if score @s hook.tut matches 1 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"移動: 向こうの石の壁の上の縁を見て右クリック。刺さった所へ飛び、勢いで跳ねて上に乗る。",color:"gray"}]
execute if score @s hook.tut matches 2 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"金ブロックの側面の上端を狙え。着いた瞬間に次を撃てる。",color:"gray"}]
execute if score @s hook.tut matches 3 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"飛び降りて空中でスニークを押し続けろ。幕の下に台の縁が見えたら撃て。",color:"gray"}]
execute if score @s hook.tut matches 4 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"ゾンビに当てて掴み、壁の的を見てもう一度右クリック。スニークで放す。",color:"gray"}]
execute if score @s hook.tut matches 5 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"片方を掴み、もう片方を見て投げろ。",color:"gray"}]
execute if score @s hook.tut matches 6 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"爆弾兵には近寄るな。遠くから掴んで、ゾンビの群れへ投げ込め。",color:"gray"}]
execute if score @s hook.tut matches 7 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"開いた扉から、島の重装兵を狙え。重い敵には自分が飛ぶ。",color:"gray"}]
execute if score @s hook.tut matches 8 run tellraw @s [{text:"▶ ",color:"aqua"},{text:"ゾンビを掴んでトゲの上へ。スニークで落とすか、トゲへ投げつけろ。",color:"gray"}]
execute if score @s hook.tut matches 9.. run tellraw @s [{text:"▶ ",color:"aqua"},{text:"開いた門をくぐれ。水晶坑道へ続いている。",color:"gray"}]
