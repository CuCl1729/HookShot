#> hook:intro/labels
# 難易度の札を書き直す。選んでいるもの(#chosen 1 のときの #level)に ▶ ◀ と明るい背景
data merge entity @e[type=text_display,tag=hook.intro_l0,limit=1] {background:1073741824,text:[{text:"ノーマル",color:"green",bold:true},{text:"\n体力20・いつもの旅",color:"gray",bold:false}]}
data merge entity @e[type=text_display,tag=hook.intro_l1,limit=1] {background:1073741824,text:[{text:"ハード",color:"gold",bold:true},{text:"\n体力12・敵が速い・浮遊が短い",color:"gray",bold:false}]}
data merge entity @e[type=text_display,tag=hook.intro_l2,limit=1] {background:1073741824,text:[{text:"ナイトメア",color:"dark_red",bold:true},{text:"\n体力6・倒れるとステージの最初から",color:"gray",bold:false}]}
execute unless score #chosen hook.diff matches 1 run return 0
execute if score #level hook.diff matches 0 run data merge entity @e[type=text_display,tag=hook.intro_l0,limit=1] {background:-2130728448,text:[{text:"▶ ノーマル ◀",color:"green",bold:true},{text:"\n体力20・いつもの旅",color:"white",bold:false}]}
execute if score #level hook.diff matches 1 run data merge entity @e[type=text_display,tag=hook.intro_l1,limit=1] {background:-2130728448,text:[{text:"▶ ハード ◀",color:"gold",bold:true},{text:"\n体力12・敵が速い・浮遊が短い",color:"white",bold:false}]}
execute if score #level hook.diff matches 2 run data merge entity @e[type=text_display,tag=hook.intro_l2,limit=1] {background:-2130728448,text:[{text:"▶ ナイトメア ◀",color:"dark_red",bold:true},{text:"\n体力6・倒れるとステージの最初から",color:"white",bold:false}]}
