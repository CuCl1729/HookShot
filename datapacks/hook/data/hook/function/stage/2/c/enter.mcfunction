#> hook:stage/2/c/enter
# @s = プレイヤー。組立場(アリーナ)に入った: 入口を閉じてウェーブ 1 を始める
scoreboard players set #cw hook.s2 1
scoreboard players set #ct hook.s2 40
execute in hook:world run fill 674 64 14 678 68 14 minecraft:iron_bars
playsound minecraft:block.iron_door.close block @a 676 66 14 2 0.6
title @s times 5 30 10
title @s title {text:"組立場",color:"gold"}
title @s subtitle {text:"3つの波を凌げ",color:"gray"}
tellraw @s {text:"炉は奥の壁の覆いの中。敵を全部片付けると覆いが外れる。",color:"gray"}
tellraw @s {text:"重装兵をプレスの下へ突き飛ばせば、衝撃波で弾いた周りの敵もまとめて潰せる。爆弾兵は掴んで群れへ投げる。",color:"gray"}
