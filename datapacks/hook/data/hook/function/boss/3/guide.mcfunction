#> hook:boss/3/guide
# いま王に傷を入れる手順を「いまの目的」に出す(boss/3/tick から毎 tick。変わったときだけ hook:guide/set を呼ぶ)
# #g: 1 第1形態 / 2 第1形態で怯み中 / 3 第2形態 / 4 第2形態で怯み中 / 5 最後の1 / 6 最後の1で怯み中
scoreboard players set #g hook.b3 0
execute if score #state hook.b3 matches 1 run scoreboard players set #g hook.b3 1
execute if score #state hook.b3 matches 3 run scoreboard players set #g hook.b3 3
execute if score #state hook.b3 matches 3 if score #hp hook.b3 matches ..1 run scoreboard players set #g hook.b3 5
execute if score #g hook.b3 matches 1.. if score #stag hook.b3 matches 1.. run scoreboard players add #g hook.b3 1
execute if score #g hook.b3 matches 0 run return 0
execute if score #g hook.b3 = #gd hook.b3 run return 0
scoreboard players operation #gd hook.b3 = #g hook.b3
execute if score #g hook.b3 matches 1 run function hook:guide/set {text:"手下を掴んで王に投げ当てろ",x:1550.5,y:65,z:0.5}
execute if score #g hook.b3 matches 2 run function hook:guide/set {text:"怯んだ王をトゲかプレスへ",x:1528.5,y:64,z:-9.5}
execute if score #g hook.b3 matches 3 run function hook:guide/set {text:"鉤で王を縛って怯ませろ",x:1550.5,y:65,z:0.5}
execute if score #g hook.b3 matches 4 run function hook:guide/set {text:"縛った王をトゲか奈落へ",x:1550.5,y:65,z:0.5}
execute if score #g hook.b3 matches 5 run function hook:guide/set {text:"とどめ: 王を縛って奈落へ",x:1550.5,y:65,z:0.5}
execute if score #g hook.b3 matches 6 run function hook:guide/set {text:"今だ! 王を奈落へ突き落とせ",x:1550.5,y:65,z:0.5}
