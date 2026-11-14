#> hook:stage/2/c/enter
# @s = プレイヤー。組立場(アリーナ)に入った: 入口を閉じてウェーブ 1 を始める
scoreboard players set #cw hook.s2 1
scoreboard players set #ct hook.s2 40
scoreboard players set #cb hook.s2 0
execute in hook:world run fill 674 64 14 678 68 14 minecraft:iron_bars
playsound minecraft:block.iron_door.close block @a 676 66 14 2 0.6
playsound minecraft:entity.ravager.roar hostile @a 676 66 27 2 0.7
playsound minecraft:block.bell.use master @a 676 66 27 2 0.6
particle minecraft:large_smoke 676 66 14 2 2 0.3 0.02 40 force @a
title @s times 5 30 10
title @s title {text:"組立場",color:"gold"}
title @s subtitle {text:"3つの波を凌げ",color:"gray"}
function hook:fairy/say {text:"閉じこめられた！ 全部倒せば奥の炉の覆いが外れるよ"}
function hook:fairy/say {text:"プレスの下で標的を撃つか、爆弾兵を群れへ投げて"}
function hook:fairy/say {text:"重装兵は突き飛ばしてプレスへ。爆弾兵は補充されるよ"}
function hook:guide/set {text:"組立場で3つの波を凌ぐ",x:676.5,y:64,z:27.5}
